//
//  TableController.swift
//  ArticlesApp
//
//  Created by Ron Haimovich on 08/05/2018.
//  Copyright © 2018 Ron Haimovich. All rights reserved.
//

import UIKit

class TableController:NSObject
{
    //MARK: - Properties
    var dataController:DataControllerProtocol!
    var webKit:ArticleWebKitProtocol!
    
    init(delegateToViewController:DataControllerDelegate)
    {
        super.init()
        dataController = DataController(delegate: delegateToViewController)
    }
}

//MARK: - UITableViewDataSource
extension TableController: UITableViewDataSource
{
    
    //MARK - NumberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return dataController.numberOfRowsInSection(section)
    }
    
    //MARK - CellForRowAtIndexPath
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        ArticleCellGenerator.registerReuseIdentifier(for: tableView)
        StripCellGenerator.registerReuseIdentifier(for: tableView)
        
        let object = dataController.objectForIndexPath(indexPath)
        
        if object.type == .regularArticleCell
        {
            let cell = ArticleCellGenerator.cell(for: indexPath, inTableVIew: tableView)
            ArticleCellGenerator.configure(cell: cell, by:object )
            
            return cell
        }
        else if object.type == .everyThirdCell
        {
            let cell = StripCellGenerator.cell(for: indexPath, inTableVIew: tableView)
            StripCellGenerator.configure(cell: cell, by:object )
            
            return cell
        }
        return UITableViewCell()
    }
    
    //MARK: - HeightForRowAtIndexPath
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var row = indexPath.row + 1
        
        if row % 3 == 0
        {
            return 150
        }
        else
        {
            row   = row - (row/3)
            row  -= 1
            return 300
        }
    }
    //MARK: - DidSelectRowAtIndexPath
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataController.didSelectRowAt(tableView, indexPath: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


//MARK: TableControllerProtocol
extension TableController: TableControllerProtocol
{
    
    
}







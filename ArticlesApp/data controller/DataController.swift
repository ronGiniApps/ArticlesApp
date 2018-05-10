//
//  DataController.swift
//  ArticlesApp
//
//  Created by Ron Haimovich on 08/05/2018.
//  Copyright © 2018 Ron Haimovich. All rights reserved.
//

import UIKit

class DataController
{
    
    //MARK: - Propeties
    weak var delegate:DataControllerDelegate?
    var newArticles : [Article]?
    
    init(delegate:DataControllerDelegate)
    {
        self.delegate = delegate
        self.fetchData()
    }
}

//MARK: - Actions
extension DataController
{
    func fetchData(){
        NetworkService.fetchArticles { (articles) in
            self.newArticles = articles
            self.delegate?.refreshUI()
        }
    }
}

//MARK: - DataControllerProtocol
 extension DataController:DataControllerProtocol
 {
    
    func heightForRowAt(_ tableView: UITableView, indexPath: IndexPath) -> Int {
        return indexPath.row
    }
    
    
    func objectForIndexPath(_ indexPath: IndexPath) -> Article
    {
        return (newArticles?[indexPath.row])!
    }
    

    
    func numberOfRowsInSection(_ section: Int) -> Int
    {
        return newArticles?.count ?? 0
    }
}






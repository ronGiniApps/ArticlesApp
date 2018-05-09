//
//  CellGenerator.swift
//  ArticlesApp
//
//  Created by Ron Haimovich on 09/05/2018.
//  Copyright © 2018 Ron Haimovich. All rights reserved.
//

import UIKit

class RegularCellGenerator: NSObject
{
    //MARK: - Properties
    var cell:UITableViewCell?
    var articles:[Article]?
    var indexPath:IndexPath?
    
    
    init(cell:UITableViewCell,articles:[Article],indexPath:IndexPath)
    {
        self.cell = cell
        self.articles = articles
        self.indexPath = indexPath
    }
}
//MARK: - Actions

extension RegularCellGenerator
{
    func generateCell(){
        
        
    }
}

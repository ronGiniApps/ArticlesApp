//
//  CellGeneretorPotocol.swift
//  ArticlesApp
//
//  Created by Ron Haimovich on 09/05/2018.
//  Copyright © 2018 Ron Haimovich. All rights reserved.
//

import UIKit

protocol CellGeneretorPotocol
{
    
    //MARK: - Methods
    static func cell(for indexPath: IndexPath, inTableVIew tableView: UITableView) -> UITableViewCell
    static func registerReuseIdentifier(for tableView: UITableView)
    static func configure(cell: UITableViewCell, by article: Article)
}

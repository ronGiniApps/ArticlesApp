//
//  DataControllerProtocol.swift
//  ArticlesApp
//
//  Created by Ron Haimovich on 08/05/2018.
//  Copyright © 2018 Ron Haimovich. All rights reserved.
//

import UIKit

protocol DataControllerProtocol
{
    func objectForIndexPath(_ indexPath: IndexPath) -> Article
    func numberOfRowsInSection(_ section: Int)-> Int
    func heightForRowAt(_ tableView: UITableView,  indexPath: IndexPath) -> Int
    func didSelectRowAt(_ tablView: UITableView,indexPath: IndexPath)
}


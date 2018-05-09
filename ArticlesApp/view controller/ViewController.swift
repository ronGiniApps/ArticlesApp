//
//  ViewController.swift
//  ArticlesApp
//
//  Created by Ron Haimovich on 08/05/2018.
//  Copyright © 2018 Ron Haimovich. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
   

    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    var tableController:TableControllerProtocol?
    
    override func viewWillLayoutSubviews() {
        
        tableController         = TableController(delegateToViewController: self)
        tableView.delegate      = tableController
        tableView.dataSource    = tableController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController : DataControllerDelegate
{
    func refreshUI()
    {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

}




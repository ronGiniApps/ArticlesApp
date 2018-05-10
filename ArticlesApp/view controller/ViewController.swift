//
//  ViewController.swift
//  ArticlesApp
//
//  Created by Ron Haimovich on 08/05/2018.
//  Copyright © 2018 Ron Haimovich. All rights reserved.
//

import UIKit

let shareNotificaition = "share_article"

class ViewController: UIViewController{
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    var tableController:TableControllerProtocol?
    
    weak var shareDelegate:ShareDelegate?
    var dataController:DataControllerProtocol!
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewWillLayoutSubviews() {
        
        tableController         = TableController(delegateToViewController: self)
        tableView.delegate      = tableController
        tableView.dataSource    = tableController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(notificationShare), name: NSNotification.Name(rawValue: "shareArticle"), object: nil)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func notificationShare(_ notification: NSNotification) {
        let sender = notification.userInfo!["button"] as? UIButton
        
        
        let buttonPosition      = sender!.convert(CGPoint.zero, to:self.tableView)
        let indexPath           = self.tableView.indexPathForRow(at: buttonPosition)
        
        
        let cell                = tableView.cellForRow(at: indexPath!)
    
        //let object = dataController.objectForIndexPath(indexPath!)
        
        
        
        

    }
}

//MARK: - Actions
extension ViewController : DataControllerDelegate
{
    func refreshUI()
    {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}






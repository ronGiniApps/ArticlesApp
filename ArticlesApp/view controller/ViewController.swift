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
        
        let sender              = notification.userInfo!["button"] as? UIButton
        let buttonPosition      = sender!.convert(CGPoint.zero, to:self.tableView)
        let indexPath           = self.tableView.indexPathForRow(at: buttonPosition)
        var row                 = indexPath![1] + 1
        
        if row % 3 == 0
        {
            let cell  = tableView.cellForRow(at: indexPath!) as? StripArticleTableViewCell
            print("third cell")
            share(url: (cell?.url)!)
        }
        else
        {
            row     = row - (row/3)
            row    -= 1
            let cell  = tableView.cellForRow(at: indexPath!) as? RegularArticleCellTableViewCell
            print("regular cell")
            share(url: (cell?.url)!)
        }
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

extension ViewController
{
    func share(url:String) {
            let url                                         = url
            let text                                        = "Hey look at this article!:\(url)"
            let shareAll                                    = [text]
            let activityViewController                      = UIActivityViewController(activityItems: shareAll, applicationActivities: nil)
            activityViewController.excludedActivityTypes    = [UIActivityType.airDrop, UIActivityType.postToFacebook,UIActivityType.mail,UIActivityType.message,UIActivityType.openInIBooks]
            self.present(activityViewController, animated: true, completion: nil)
    }
}







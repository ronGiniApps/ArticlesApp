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
    @IBOutlet weak var tableView                : UITableView!
    @IBOutlet weak var activityIndicator        : UIActivityIndicatorView!
    @IBOutlet weak var menuLeadingConstraint    : NSLayoutConstraint!
    @IBOutlet weak var rightMenu                : UIView!
    
    @IBAction func openCloseRightMenu(_ sender: UIBarButtonItem)
    {
        openCloseRightMenu()
    }
    
    //MARK: - Properties
    var tableController     :   TableControllerProtocol?
    var dataController      :   DataControllerProtocol!
    var webController       :   ArticleWebKitProtocol!
    weak var shareDelegate  :   ShareDelegate?
    var isMenuOpen          =   false


    deinit
    {
        NotificationCenter.default.removeObserver(self)
    }
    
    //MARK: - ViewWillLayoutSubviews
    override func viewWillLayoutSubviews() {
        
        tableController         =   TableController(delegateToViewController: self)
        tableView.delegate      =   tableController
        tableView.dataSource    =   tableController
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(notificationShare), name: NSNotification.Name(rawValue: "shareArticle"), object: nil)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @objc func notificationShare(_ notification: NSNotification) {
        
        let sender              =   notification.userInfo!["button"] as? UIButton
        let buttonPosition      =   sender!.convert(CGPoint.zero, to:self.tableView)
        let indexPath           =   self.tableView.indexPathForRow(at: buttonPosition)
        var row                 =   indexPath![1] + 1
        
        if row % 3 == 0
        {
            let cell  = tableView.cellForRow(at: indexPath!) as? StripArticleTableViewCell
            print("third cell")
            share(url: (cell?.url)!)
            
        }
        else
        {
            row       = row - (row/3)
            row      -= 1
            let cell  = tableView.cellForRow(at: indexPath!) as? RegularArticleCellTableViewCell
            print("regular cell")
            share(url: (cell?.url)!)
        }
    }
}

//MARK: - Actions
extension ViewController : DataControllerDelegate
{
    //MARK: - PrepareForSegue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destVC : WebKitController  = segue.destination as? WebKitController
        {
            let url                       = sender as? String
            destVC.url                    = url
        }
    }
    
    //MARK: - RefreshUI
    func refreshUI()
    {
        DispatchQueue.main.async
        {
            self.tableView.reloadData()
            self.activityIndicator.stopAnimating()
        }
    }
}

//MARK: - Share
extension ViewController
{
    func share(url:String)
    {
            let url                                         = url
            let text                                        = "Hey look at this article!:\(url)"
            let shareAll                                    = [text]
            let activityViewController                      = UIActivityViewController(activityItems: shareAll, applicationActivities: nil)
            activityViewController.excludedActivityTypes    = [UIActivityType.airDrop, UIActivityType.postToFacebook,UIActivityType.mail,UIActivityType.message,UIActivityType.openInIBooks]
            self.present(activityViewController, animated: true, completion: nil)
    }
}


//MARK: - OpenClocseRightMenu
extension ViewController
{
    func openCloseRightMenu()
    {
        if isMenuOpen
        {
  
            UIView.animate(withDuration: 0.3) {
                self.menuLeadingConstraint.constant         -= self.rightMenu.frame.width
                self.rightMenu.layer.shadowOpacity           = 0
                self.rightMenu.layer.shadowRadius            = 0
                self.view.layoutIfNeeded()
            }
        }
        else
        {
            UIView.animate(withDuration: 0.3) {
                self.menuLeadingConstraint.constant         += self.rightMenu.frame.width
                self.rightMenu.layer.shadowOpacity           = 1
                self.rightMenu.layer.shadowRadius            = 6
                self.view.layoutIfNeeded()
            }
        }
        isMenuOpen = !isMenuOpen
    }
}






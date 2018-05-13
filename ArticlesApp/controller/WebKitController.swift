//
//  WebKitController.swift
//  ArticlesApp
//
//  Created by Ron Haimovich on 13/05/2018.
//  Copyright © 2018 Ron Haimovich. All rights reserved.
//

import UIKit
import WebKit

class WebKitController:UIViewController
{

    //MARK: - Properties
    var webView : WKWebView!
    var url     : String?
    let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
    
    
    //MARK: - ViewDidLayoutSubviews
    override func viewDidLayoutSubviews() {
        activityIndicator.hidesWhenStopped  = true
        activityIndicator.color             = UIColor.gray
        activityIndicator.center            = self.view.center
        activityIndicator.startAnimating()
        self.view.addSubview(activityIndicator)
    }
    
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        
        if url != nil
        {
            let request = URLRequest(url: URL(string:url!)!)
            webView.load(request)
        }
        else
        {
            print("no url")
        }
    }
}


//MARK: - Actions
extension WebKitController:ArticleWebKitProtocol
{
    
    //MARK: - loadView
    override func loadView()
    {
        let webConfiguration = WKWebViewConfiguration()
        webView                         = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.navigationDelegate      = self
        view                            = webView
    }
    
    //MARK: - didFinish
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }
}


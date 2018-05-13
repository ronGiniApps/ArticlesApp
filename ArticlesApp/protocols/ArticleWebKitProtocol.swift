//
//  ArticleWebKitProtocol.swift
//  ArticlesApp
//
//  Created by Ron Haimovich on 13/05/2018.
//  Copyright © 2018 Ron Haimovich. All rights reserved.
//

import UIKit
import WebKit

protocol ArticleWebKitProtocol:WKNavigationDelegate,WKUIDelegate {
    func loadView()
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!)
}

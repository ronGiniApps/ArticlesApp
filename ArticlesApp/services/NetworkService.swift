//
//  NetworkManager.swift
//  ArticlesApp
//
//  Created by Ron Haimovich on 08/05/2018.
//  Copyright © 2018 Ron Haimovich. All rights reserved.
//

import UIKit

class NetworkService{
    
    //MARK: - fetchArticles
    static func fetchArticles(completion:@escaping ([Article])->())
    {
        ArticlesProvider.getArticles { (jsonObject) in
            ArticlesParser.parseArticles(jsonObject: jsonObject, completion: { (articles) in
                completion(articles)
            })
        }
    }
}


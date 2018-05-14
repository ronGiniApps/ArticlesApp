//
//  ParseJson.swift
//  ArticlesApp
//
//  Created by Ron Haimovich on 08/05/2018.
//  Copyright © 2018 Ron Haimovich. All rights reserved.
//

import UIKit

class ArticlesParser {
    
    //MARKS: - Parser
    static func parseArticles(jsonObject:[String:Any],completion:@escaping ([Article])->())
    {
        var myArticles = [Article]()
        var imageUrl   = ""
        var title      = ""
        var subTitle   = ""
        var author     = ""
        var date       = ""
        var url        = ""
        var type       = ArticleDefine.ArticlesTypes.regularArticleCell
        
        guard let articles = jsonObject["articles"] as? [[String:Any]] else
            {
            print("articles error")
            return
        }
        
            for (index,article) in articles.enumerated() {
                var row     = index + 1
                title       = checkObjInJson(objKeyInJson: "title", objFromJson: article)
                subTitle    = checkObjInJson(objKeyInJson: "description", objFromJson: article)
                author      = checkObjInJson(objKeyInJson: "author", objFromJson: article)
                imageUrl    = checkObjInJson(objKeyInJson: "urlToImage", objFromJson: article)
                date        = checkObjInJson(objKeyInJson: "publishedAt", objFromJson: article)
                url         = checkObjInJson(objKeyInJson: "url", objFromJson: article)
                    
                if row % 3 == 0
                {
                    type = ArticleDefine.ArticlesTypes.everyThirdCell
                }
                else
                {
                    row   = row - (row/3)
                    row  -= 1
                    type  = ArticleDefine.ArticlesTypes.regularArticleCell
                    
                }
                
                let myArticle = Article(
                    imgUrl  : imageUrl,
                    title   : title,
                    subTitle: subTitle,
                    author  : author,
                    date    : date,
                    url     : url,
                    type    : type)
                myArticles.append(myArticle)
            }
            completion(myArticles)
        }

    
    //MARKS: - isObjectInJson
    static func checkObjInJson(objKeyInJson:String,objFromJson:[String:Any])-> String
    {
        if let obj = objFromJson[objKeyInJson] as? String
        {
            return obj
        }
        else
        {
            print("no",objKeyInJson)
            return ""
        }
    }
}

//
//  Article.swift
//  ArticlesApp
//
//  Created by Ron Haimovich on 08/05/2018.
//  Copyright © 2018 Ron Haimovich. All rights reserved.
//

import UIKit

struct Article {
    var imgUrl   :String?
    var url      :String?
    var title    :String?
    var subTitle :String?
    var author   :String?
    var date     :String?
    var type     :ArticleDefine.ArticlesTypes
    
    init (imgUrl:String,title:String,subTitle:String,author:String,date:String,url:String,type:ArticleDefine.ArticlesTypes){
        self.imgUrl     = imgUrl
        self.title      = title
        self.subTitle   = subTitle
        self.author     = author
        self.date       = date
        self.url        = url
        self.type       = type
    }
}

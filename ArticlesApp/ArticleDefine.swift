//
//  ArticleDefine.swift
//  ArticlesApp
//
//  Created by Ron Haimovich on 08/05/2018.
//  Copyright © 2018 Ron Haimovich. All rights reserved.
//

import UIKit


    struct ArticleDefine: Typeable
    {
        var type: ArticleDefine.ArticlesTypes
        
        enum ArticlesTypes:Equatable{
            
            case everyThirdCell
            case regularArticleCell
            
        }
    }


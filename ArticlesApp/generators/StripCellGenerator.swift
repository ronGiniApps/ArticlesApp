//
//  StripCellGenerator.swift
//  ArticlesApp
//
//  Created by Ron Haimovich on 09/05/2018.
//  Copyright © 2018 Ron Haimovich. All rights reserved.
//

import UIKit

class StripCellGenerator: NSObject {
    static func cell(for indexPath: IndexPath, inTableVIew tableView: UITableView) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier:StripArticleTableViewCell.cellID , for:indexPath  )
    }
    
    static func registerReuseIdentifier(for tableView: UITableView) {
        tableView.register(StripArticleTableViewCell.cellNib, forCellReuseIdentifier: StripArticleTableViewCell.cellID)
    }
    
    static func configure(cell: UITableViewCell, by article: Article) {
        guard let cell = cell as? StripArticleTableViewCell else {return}
        
        cell.articleTitle.text            = article.title
        cell.articleSubtitle.text         = article.subTitle
        cell.articleAuthor.text           = article.author

        
        
        cell.articleImage.sd_setImage(with: URL(string: article.imgUrl!), placeholderImage: #imageLiteral(resourceName: "image_place_holder"), options: [], completed: nil)
        
    }
}

//
//  ArticleCellGenerator.swift
//  ArticlesApp
//
//  Created by Ron Haimovich on 09/05/2018.
//  Copyright © 2018 Ron Haimovich. All rights reserved.
//

import UIKit
import SDWebImage


class ArticleCellGenerator: CellGeneretorPotocol {
    static func cell(for indexPath: IndexPath, inTableVIew tableView: UITableView) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier:RegularArticleCellTableViewCell.cellID , for:indexPath  )
    }
    
    static func registerReuseIdentifier(for tableView: UITableView) {
        tableView.register(RegularArticleCellTableViewCell.cellNib, forCellReuseIdentifier: RegularArticleCellTableViewCell.cellID)
    }
    
    static func configure(cell: UITableViewCell, by article: Article) {
        guard let cell = cell as? RegularArticleCellTableViewCell else {return}
        
        
        cell.articleTitle.text          = article.title
        cell.articleSubTitle.text       = article.subTitle
        cell.articleAuthor.text         = article.author
        
        cell.articleImage.sd_setImage(with: URL(string: article.imgUrl!), placeholderImage: #imageLiteral(resourceName: "image_place_holder"), options: [], completed: nil)
        
    }
    
}

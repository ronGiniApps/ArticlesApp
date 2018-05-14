//
//  RegularArticleCellTableViewCell.swift
//  ArticlesApp
//
//  Created by Ron Haimovich on 08/05/2018.
//  Copyright © 2018 Ron Haimovich. All rights reserved.
//

import UIKit

class RegularArticleCellTableViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var articleImage     : UIImageView!
    @IBOutlet weak var articleTitle     : UILabel!
    @IBOutlet weak var articleSubTitle  : UILabel!
    @IBOutlet weak var articleAuthor    : UILabel!
    @IBOutlet weak var articleDate      : UILabel!
    @IBOutlet weak var cellView         : UIView!
    @IBOutlet weak var shareBtn         : UIButton!
    
    
    @IBAction func shareArticleAction(_ sender: UIButton)
    {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "shareArticle"), object: nil, userInfo: ["button" : sender])
    }
    
    //MARK: - Properties
    weak var shareDelegate:ShareDelegate?
    var url = ""

   
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
    
}
extension RegularArticleCellTableViewCell:CellInfoable{}

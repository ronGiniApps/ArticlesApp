//
//  StripArticleTableViewCell.swift
//  ArticlesApp
//
//  Created by Ron Haimovich on 08/05/2018.
//  Copyright © 2018 Ron Haimovich. All rights reserved.
//

import UIKit

class StripArticleTableViewCell: UITableViewCell
{

    //MARKS: - Outlets
    @IBOutlet weak var articleImage     : UIImageView!
    @IBOutlet weak var articleTitle     : UILabel!
    @IBOutlet weak var articleSubtitle  : UILabel!
    @IBOutlet weak var articleAuthor    : UILabel!
    @IBOutlet weak var articleDate      : UILabel!
    @IBOutlet weak var cellView         : UIView!
    @IBOutlet weak var shareBtn         : UIButton!
    
    
    //MARKS: - Properties
    weak var delegate:ShareDelegate?
    var url =  ""


    @IBAction func shareArticleAction(_ sender: UIButton)
    {
        NotificationCenter.default.post(name:  NSNotification.Name(rawValue: "shareArticle"), object: nil, userInfo: ["button" : sender])
    }
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
}

extension StripArticleTableViewCell:CellInfoable{}

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
    @IBOutlet weak var cellView: UIView!
    
    var url = ""
    
    weak var delegate:ShareProtocol?
    
    //MARKS: - Actions
    @IBAction func shareArticleAction(_ sender: UIButton) {
        delegate?.share(url)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension RegularArticleCellTableViewCell:CellInfoable{}

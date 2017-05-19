//
//  NewsTableViewCell.swift
//  News
//
//  Created by IMPESA S.A on 5/18/17.
//  Copyright © 2017 IMPESA S.A. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setupCell(news: News){
        titleLabel.text = news.titleNews
        descriptionLabel.text = news.descriptionNews
    }
    
}

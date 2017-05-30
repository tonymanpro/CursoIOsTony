//
//  CatCustomTableViewCell.swift
//  Quiz4
//
//  Created by IMPESA S.A on 5/30/17.
//  Copyright © 2017 IMPESA S.A. All rights reserved.
//

import UIKit

class CatCustomTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(cat: Cats){
        nameLabel.text = cat.name
    }
    
}

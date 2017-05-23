//
//  CustomTableViewCell.swift
//  Tarea 2
//
//  Created by IMPESA S.A on 5/22/17.
//  Copyright © 2017 IMPESA S.A. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var primoLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

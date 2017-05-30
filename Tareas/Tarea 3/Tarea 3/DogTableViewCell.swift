//
//  DogTableViewCell.swift
//  Tarea 3
//
//  Created by IMPESA S.A on 5/28/17.
//  Copyright © 2017 IMPESA S.A. All rights reserved.
//

import UIKit

class DogTableViewCell: UITableViewCell {

    @IBOutlet weak var dogImage: UIImageView!
    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(dog: Dogs){
        dogImage.image = UIImage(data: dog.imageName as Data)
        nombreLabel.text = dog.name
        colorLabel.text = dog.color
    }
    
}

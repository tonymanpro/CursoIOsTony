//
//  DogTableViewCell.swift
//  Tarea 4
//
//  Created by IMPESA S.A on 6/4/17.
//  Copyright © 2017 IMPESA S.A. All rights reserved.
//

import UIKit

class DogTableViewCell: UITableViewCell {

    @IBOutlet weak var dogImage: UIImageView!
    @IBOutlet weak var dogName: UILabel!
    @IBOutlet weak var dogColor: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setupCell(dog: Dogs){
        dogImage.image = UIImage(named: dog.imageName!)
        dogName.text = dog.dogName
        dogColor.text = dog.dogColor
    }

    
}

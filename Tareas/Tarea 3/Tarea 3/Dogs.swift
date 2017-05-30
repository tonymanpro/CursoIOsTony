//
//  Dogs.swift
//  Tarea 3
//
//  Created by IMPESA S.A on 5/29/17.
//  Copyright © 2017 IMPESA S.A. All rights reserved.
//

import Foundation
import RealmSwift


// News model
class Dogs: Object {
    dynamic var name = ""
    dynamic var imageName: NSData!
    dynamic var color = ""
    dynamic var order = 0
}


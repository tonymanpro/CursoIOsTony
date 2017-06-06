//
//  CoreDataManager.swift
//  Tarea 4
//
//  Created by IMPESA S.A on 6/4/17.
//  Copyright © 2017 IMPESA S.A. All rights reserved.
//

import UIKit
import CoreData
import MagicalRecord

class CoreDataManager: NSObject {
    
    class func getAllDogs() -> [Dogs] {
        let result = Dogs.mr_findAll()
        if result!.count == 0 {
            return createDefaultDog()
        }
        return result as! [Dogs]
    }
    
    class func createDefaultDog() -> [Dogs] {
        createDog(dogName: "Firulais", dogColor: "White", imageName: "dog01")
        saveContext()
        return getAllDogs()
    }
    
    class func createDog(dogName:String, dogColor: String, imageName:String){
        let dog = Dogs.mr_createEntity()
        dog?.dogName = dogName
        dog?.dogColor = dogColor
        dog?.imageName = imageName
        saveContext()
    }
    
    
    
    private class func saveContext() {
        NSManagedObjectContext.mr_default().mr_saveToPersistentStoreAndWait()
    }
    
    
}

//
//  RealmManager.swift
//  Tarea 3
//
//  Created by IMPESA S.A on 5/29/17.
//  Copyright © 2017 IMPESA S.A. All rights reserved.
//

import UIKit
import RealmSwift

class RealmManager: NSObject {
    
    
    class func getAllDogsResult() -> Results<Dogs>{
        let realm = try! Realm()
        let dogs = realm.objects(Dogs.self)
        if(dogs.count > 0){
            return dogs
        }
        else{
            return createDefaultDogs()
        }
    }
    
    class func getAllDogs() -> List<Dogs>?{
        let realm = try! Realm()
        
        var data = realm.objects(Dogs.self)
        
        let convert = data.reduce(List<Dogs>()) {(list, element) -> List<Dogs> in
        list.append(element)
        return list
        }
        
        return convert
    }
    
    private class func createDefaultDogs() -> Results<Dogs>{
        let originalDog = Dogs(value: ["name": "Primari", "imageName": UIImageView?.self, "color": "White", "order": 0])
        addObjectToRealm(realmObject: originalDog)
        return getAllDogsResult()
    }
    
    class func addDogs(name: String, imageName: NSData, color: String){
        let dog = Dogs()
        dog.name = name
        dog.imageName = imageName
        dog.color = color
        dog.order = getAllDogsResult().count + 1
        addObjectToRealm(realmObject: dog)
    }

    
    
    private class func addObjectToRealm(realmObject: Object){
        let realm = try! Realm()
        try! realm.write {
            realm.add(realmObject)
        }
    }
    
}


extension Results {
    func toArray() -> [T] {
        return self.map{$0}
    }
}

extension RealmSwift.List {
    func toArray() -> [T]{
    return self.map{$0}
    }
}






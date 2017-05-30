//
//  RealmManager.swift
//  Quiz4
//
//  Created by IMPESA S.A on 5/30/17.
//  Copyright © 2017 IMPESA S.A. All rights reserved.
//

import Foundation
import RealmSwift

class RealmManager: NSObject {

    class func getAllCatsResult() -> Results<Cats>{
        let realm = try! Realm()
        let cats = realm.objects(Cats.self)
        if(cats.count > 0){
            return cats
        }
        else{
            return createDefaultCats()
        }
    }
    
    class func getAllCats() -> List<Cats>?{
        let realm = try! Realm()
        
        let data = realm.objects(Cats.self)
        
        let convert = data.reduce(List<Cats>()) {(list, element) -> List<Cats> in
            list.append(element)
            return list
        }
        
        return convert
    }
    
    private class func createDefaultCats() -> Results<Cats>{
        let originalCat = Cats(value: ["name": "Primari"])
        addObjectToRealm(realmObject: originalCat)
        return getAllCatsResult()
    }
    
    class func addCats(name: String){
        let cat = Cats()
        cat.name = name
        addObjectToRealm(realmObject: cat)
    }
    
    class func validateCat(cat: String) -> Bool{
        let realm = try! Realm()
        let predicate = NSPredicate(format: "name = %@", cat)
        
        let existCat = realm.objects(Cats.self).filter(predicate).first
        
        guard let _ = existCat  else {
            return false
        }
        return true
    }
    
    private class func addObjectToRealm(realmObject: Object){
        let realm = try! Realm()
        try! realm.write {
            realm.add(realmObject)
        }
    }
    


}

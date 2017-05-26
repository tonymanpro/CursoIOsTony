//
//  RealmManager.swift
//  News
//
//  Created by IMPESA S.A on 5/25/17.
//  Copyright © 2017 César Brenes Solano. All rights reserved.
//

import UIKit
import RealmSwift

class RealmManager: NSObject {
    

    class func getAllCategories() -> Results<Category>{
        let realm = try! Realm()
        let categories = realm.objects(Category.self)
        if(categories.count > 0){
            return categories
        }
        else{
           return createDefaultCategories()
        }
    }
    
    class func getAllNewsWithCategoryType() -> Results<Category>{
        let realm = try! Realm()
        return realm.objects(Category.self).filter("name contains 'Fido'")

    }
    
    class func getAllNews(categoryType: Int) -> List<News>?{
        return  getCategory(type: categoryType).news
    }
    
    
    class func getCategory(type: Int) -> Category{
        let realm = try! Realm()
        let predicate = NSPredicate(format: "type = %d", type)
        return realm.objects(Category.self).filter(predicate).first!
    }
    
    class func createNews(categoryType: Int, title: String, description: String){
        let category = getCategory(type: categoryType)
        let news = News()
        news.titleNews = title
        news.descriptionNews = description
        news.createdAt = Date()
        news.category = category
        let realm = try! Realm()
        try! realm.write {
            category.news.append(news)
        }
        addObjectToRealm(realmObject: news)
    }
    
    
    private class func createDefaultCategories() -> Results<Category>{
        
        let economyCategory = Category(value: ["name": "Enconomía", "imageName": "economy", "type": 1])
        let sportsCategory = Category(value: ["name": "Sports", "imageName": "sports", "type": 2])
        let technologyCategory = Category(value: ["name": "Tecnología", "imageName": "technology", "type": 3])
        let incidentCategory = Category(value: ["name": "Sucesos", "imageName": "incident", "type": 4])
        addObjectToRealm(realmObject: economyCategory)
        addObjectToRealm(realmObject: sportsCategory)
        addObjectToRealm(realmObject: technologyCategory)
        addObjectToRealm(realmObject: incidentCategory)
        return getAllCategories()
    }
    
    
    
    private class func addObjectToRealm(realmObject: Object){
        let realm = try! Realm()
        try! realm.write {
            realm.add(realmObject)
        }
    }
    
}

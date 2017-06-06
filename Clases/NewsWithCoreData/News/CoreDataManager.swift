//
//  CoreDataManager.swift
//  News
//
//  Created by IMPESA S.A on 5/30/17.
//  Copyright © 2017 César Brenes Solano. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager: NSObject {
    
    
    class func getAllCategories() -> [Category] {
        let result = Category.mr_findAll()
        if result!.count == 0 {
            return createDefaultcategory()
        }
        return result as! [Category]
    }
    
    class func createDefaultcategory() -> [Category] {
        createCategory(name: "Economia", imageName: "economy")
        createCategory(name: "Sucesos", imageName: "incident")
        createCategory(name: "Deportes", imageName: "sports")
        createCategory(name: "Tecnología", imageName: "technology")
        saveContext()
        return getAllCategories()
    }
    
    private class func createCategory(name:String, imageName:String){
        let category = Category.mr_createEntity()
        category?.name = name
        category?.imageName = imageName
    }
    
    private class func saveContext() {
        NSManagedObjectContext.mr_default().mr_saveToPersistentStoreAndWait()
    }

    class func getAllNews(type: String) -> [News] {
        let result = News.mr_findAll()
        if result!.count == 0 {
            return result as! [News]
        }
        return result as! [News]
    }
    
    class func addNews(category: Category, title: String, text: String){
        let new = News.mr_createEntity()
        new?.title = title
        new?.descriptionNews = text
        category.addNewsObject(new!)
        saveContext()
    }
    
    
    
}

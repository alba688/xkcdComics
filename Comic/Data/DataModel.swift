//
//  DataModel.swift
//  Comic
//
//  Created by Alexandra Baker on 15/04/2023.
//

import Foundation
import CoreData

struct DataModel {
    
    // to share within app
    static let myShared = DataModel()
    
    // storage for core data
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Database")
        
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores {
            (description, error) in
            if let myError = error as NSError? {
                print("Error. Could not open database \(myError), \(myError.userInfo)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    // functions to add, save, delete comics to core data
    //MARK: remember to wrap number in Int(value) upon retrieval
    func addComic(comic: Comic) {
        let myContext = container.viewContext
        let myComic = DbFavorites(context: myContext)
        
        myComic.id = UUID()
        myComic.number = Int16(comic.num)
        myComic.title = comic.title
        myComic.image = comic.img
    }
    
    func save() {
        let myContext = container.viewContext
        
        if myContext.hasChanges {
            do {
                try myContext.save()
            }
            catch {
                print("Error, could not save changes \(error), \(error.localizedDescription)")
            }
        }
    }
    
    func deleteComic(comic: DbFavorites) {
        let myContext = container.viewContext
        myContext.delete(comic)
        do {
            try myContext.save()
        } catch {
            print(error)
        }
    }
    
}

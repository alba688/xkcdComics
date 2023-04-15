//
//  ComicApp.swift
//  Comic
//
//  Created by Alexandra Baker on 15/04/2023.
//

import SwiftUI

@main
struct ComicApp: App {
    
    @StateObject var viewModel = ComicViewModel()
    @Environment(\.scenePhase) var myScene
    
    let db = DataModel.myShared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
                .environment(\.managedObjectContext, db.container.viewContext)
        }.onChange(of: myScene) {
            myScene in
            db.save()
        }
    }
}

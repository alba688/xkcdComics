//
//  ContentView.swift
//  Comic
//
//  Created by Alexandra Baker on 15/04/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            TabView {
                BrowseView().tabItem {
                   Label("Browse", systemImage: "house.fill")
                }
                FavoriteView().tabItem {
                    Label("Faves", systemImage: "heart.circle")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ComicViewModel())
    }
}

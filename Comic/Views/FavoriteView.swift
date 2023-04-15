//
//  FavoriteView.swift
//  Comic
//
//  Created by Alexandra Baker on 15/04/2023.
//

import SwiftUI

struct FavoriteView: View {
    var body: some View {
        NavigationView {
            List {
                Text("Comic 921")
                Text("Comic 121")
                Text("Comic 234")
            }.navigationTitle("Favorite Comics")
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}

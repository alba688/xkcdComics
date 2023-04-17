//
//  FavoriteView.swift
//  Comic
//
//  Created by Alexandra Baker on 15/04/2023.
//

import SwiftUI

struct FavoriteView: View {
    // declare managed object context
    @Environment(\.managedObjectContext) var viewContext
    
    //fetch request for entity
    @FetchRequest(entity: DbFavorites.entity(),
                  sortDescriptors: [
                    NSSortDescriptor(keyPath: \DbFavorites.number, ascending: true)
                  ])
    
    private var dbFavorites: FetchedResults<DbFavorites>
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(dbFavorites, id: \.self) { favorite in
                    HStack {
                        
                        let url = URL(string: favorite.image ?? "")
                        AsyncImage(url: url, content: { returnedImage in
                            returnedImage.resizable().scaledToFit()
                        }, placeholder: {
                            ProgressView()
                        }).frame(width: 150, height: 75)
                        
                        VStack(alignment: .leading) {
                            Text("#\(Int(favorite.number))").padding(.top)
                            Text(favorite.title ?? "empty")
                            Spacer()
                        }.padding(.leading)
                    }
                    .swipeActions(content: {
                        Button(role: .destructive, action: {
                            DataModel.myShared.deleteComic(comic: favorite)
                        }, label: {
                            Image(systemName: "trash")
                        })
                    })
                }
            }.navigationTitle("Favorite Comics")
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView().environment(\.managedObjectContext, DataModel.myShared.container.viewContext)
    }
}

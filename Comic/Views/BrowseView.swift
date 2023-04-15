//
//  BrowseView.swift
//  Comic
//
//  Created by Alexandra Baker on 15/04/2023.
//

import SwiftUI

struct BrowseView: View {
    @StateObject var viewModel = ComicViewModel()
    @State var comicInt = Int.random(in: 1...2762)
    
    var body: some View {
        VStack {
            
            // Comic Area
            Text("Title: \(viewModel.comic.title)")
            Text("Comic Nr: \(viewModel.comic.num)")
            Image("")
                .frame(width: 300, height: 200)
                .background(Color.gray)
            
            
            // Navigation Buttons
            HStack {
                Button("<< Previous") {
                    //action
                }.buttonStyle(.bordered)
                Button("Next >>") {
                    //action
                }.buttonStyle(.bordered)
            }
            
            // Search Area
            Text("Search comics")
                .padding(20)
                .border(Color.blue, width:2)
        }.onAppear {
            viewModel.fetchComic(comicNum: comicInt)
        }
    }
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView()
    }
}

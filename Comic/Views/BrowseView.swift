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
        NavigationView {
            VStack {
                
                // Comic Area
                Text("\(viewModel.comic.title)")
                    .font(.title2)
                Text("# \(viewModel.comic.num)")
                    .font(.headline)
                
                // MARK: Link to DetailView
                Text("Explain this >>")
                
                
                AsyncImage(url: URL(string: "\(viewModel.comic.img)")) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                    } else if phase.error != nil {
                        Text("Error loading the image.")
                    } else {
                        ProgressView()
                    }
                }
                .frame(width: 350, height: 300)
                .padding(.bottom, 10.0)
                
                
                // Navigation Buttons
                HStack {
                
                    Button {
                        comicInt -= 1
                        viewModel.fetchComic(comicNum: comicInt)
                    } label: {
                        Image(systemName: "arrow.left")
                        Text("Previous")
                    }.buttonStyle(.bordered)
                    Spacer()
                    Button {
                        comicInt += 1
                        viewModel.fetchComic(comicNum: comicInt)
                    } label: {
                        Text("Next")
                        Image(systemName: "arrow.right")
                    }.buttonStyle(.bordered)
                }
                .padding([.leading, .bottom, .trailing], 50.0)
                
                // Search Area
                Text("Search comics")
                    .padding(20)
                    .border(Color.blue, width:2)
            }.onAppear {
                viewModel.fetchComic(comicNum: comicInt)
            }.navigationTitle("XKCD Comics")
        }
    }
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView()
    }
}

//
//  BrowseView.swift
//  Comic
//
//  Created by Alexandra Baker on 15/04/2023.

// References:
// * Async Image https://www.youtube.com/watch?v=O4xkQK6sHVU

//

import SwiftUI

struct BrowseView: View {
    @StateObject var viewModel = ComicViewModel()
    @State var comicInt = Int.random(in: 1...2762)
    @State var comicInput = ""
    
    var body: some View {
        NavigationView {
            VStack {
                
                // Comic Area
                Text("\(viewModel.comic.title)")
                    .font(.title)
                Text("\(viewModel.comic.alt)")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                NavigationLink(
                    destination: DetailView(number: comicInt)
                ) {
                    Text("View Details of Comic # \(viewModel.comic.num)")
                }
                
                
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
                // MARK: Validate number doesnt go out of bounds
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
                HStack {
                    TextField("Enter number 1-2762", text: $comicInput)
                        .keyboardType(.decimalPad)
                        .border(Color.gray, width: 1)
                        .padding()
                    
                    Button( "Search", action: {
                        comicInt = Int(comicInput) ?? 1
                        viewModel.fetchComic(comicNum: comicInt)
                        
                    }).buttonStyle(.bordered)
                }.padding(.horizontal, 50.0)
                
            }.onAppear {
                viewModel.fetchComic(comicNum: comicInt)
            }.navigationTitle("XKCD Comics")
        }
    }
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView().environmentObject(ComicViewModel())
    }
}

//
//  DetailView.swift
//  Comic
//
//  Created by Alexandra Baker on 15/04/2023.

// References
// * Parse HTML with SwiftSoup https://github.com/scinfu/SwiftSoup

import SwiftUI
import WebKit
import SwiftSoup

struct DetailView: View {
    
    var comic: Comic
    init(comic: Comic) {
        self.comic = comic
    }

    @State private var explanationTxt = ""
    @State var isConfirmed = false
    @State var isCompleted = false
    @State private var showingExplanation = false
    
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                // Comic Area
                Text("More about \(comic.title)").font(.title)
                
                // Comic Details
                AsyncImage(url: URL(string: "\(comic.img)")) { phase in
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
                
                Text("Here is the alt text:")
                    .multilineTextAlignment(.center)
                Text("\(comic.alt)").font(.headline)
                                
                Spacer()
                // Toggle sheet view
                Text("Still confused?")
                Button("Explain this comic") {
                            showingExplanation.toggle()
                        }
                        .buttonStyle(.bordered)
                        .sheet(isPresented: $showingExplanation) {
                            ExplanationView(comic: comic)
                        }
                
                Spacer()
                
                // Action buttons
                HStack {
                    Button {
                        isConfirmed = true
                    } label: {
                        Image(systemName: "heart.fill")
                        Text("Favorite")
                    }
                    .buttonStyle(.borderedProminent)
                    .confirmationDialog( "Save", isPresented: $isConfirmed) {
                        Button("Save to Favorites?") {
                            DataModel.myShared.addComic(comic: comic)
                            DataModel.myShared.save()
                            isCompleted = true
                        }
                    }.alert("Comic was saved!", isPresented: $isCompleted) {
                        Button("Ok", role: .cancel) {}
                    }
                    
                    Spacer()
                    ShareLink(
                        item: "\(comic.img)",
                        preview: SharePreview (
                            "Check out this XKCD comic"
                        )
                    ) {
                        Label("Share", systemImage: "paperplane.fill")
                    }.buttonStyle(.borderedProminent)
                    
                }.padding(.horizontal, 50.0)
                Spacer()
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(comic: Comic(title: "title", num: 1, img: "https://imgs.xkcd.com/comics/barrel_cropped_(1).jpg", alt: "text"))
    }
}

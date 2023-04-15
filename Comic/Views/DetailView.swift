//
//  DetailView.swift
//  Comic
//
//  Created by Alexandra Baker on 15/04/2023.

// References
// * Parse HTML with SwiftSoup https://www.youtube.com/watch?v=POVZj4FkEPs

import SwiftUI
import WebKit
import SwiftSoup

struct DetailView: View {
    
    let number: Int
    let urlString = "https://www.explainxkcd.com/wiki/index.php/123"


    func getTextFromWebsite(urlString: String) -> String {
        var text = ""
        guard let url = URL(string: urlString) else {
            return text
        }
        
        do {
            let html = try String(contentsOf: url, encoding: .utf8)
            let doc = try SwiftSoup.parse(html)
            let p = try doc.select("p").first()
            text = try p?.text() ?? "Text not found"
        } catch {
            print("Error parsing HTML: \(error)")
        }
        
        return text
    }

    
    var body: some View {
        NavigationView {
            VStack {
                
                // Comic Area
                Text("Comic # \(number)").font(.title)

                
                Text(getTextFromWebsite(urlString: urlString)).padding()
                
                
                
                HStack {
                    Button("Favorite ❤️") {
                        //action here
                    }.buttonStyle(.bordered)
                    Spacer()
                    Button("Share ⭐️") {
                        //action here
                    }.buttonStyle(.bordered)
                    
                }.padding([.leading, .top, .trailing], 50.0)
                
                Spacer()
            }
        }.toolbar(.hidden, for: .tabBar)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(number: 1)
    }
}

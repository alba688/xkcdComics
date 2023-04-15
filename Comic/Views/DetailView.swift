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

    @State private var explanationText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                
                // Comic Area
                Text("Comic # \(number)").font(.title)
                
                Text(explanationText).padding()
                
                Button("Help! Explain this comic") {
                    do {
                        let html = try String(contentsOf: URL(string: "https://www.explainxkcd.com/wiki/index.php/\(number)")!)
                        let doc = try SwiftSoup.parse(html)
                        let paras = try doc.select("p")
                        var explanationText = ""
                        
                        for p: Element in paras {
                            explanationText += try p.text()
                            explanationText += "\n"
                        }
                        
                        self.explanationText = explanationText
                        
                        
                        
                        //explanationText = try p?.text() ?? "Text not found"
                    } catch {
                        print("Error: \(error)")
                        
                    }
                }.buttonStyle(.bordered)

                
                //Text(getTextFromWebsite(urlString: urlString)).padding()
                
                
                
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

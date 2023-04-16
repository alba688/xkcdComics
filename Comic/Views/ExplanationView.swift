//
//  ExplanationView.swift
//  Comic
//
//  Created by Alexandra Baker on 16/04/2023.
//  Referenced:
//  https://www.hackingwithswift.com/quick-start/swiftui/how-to-present-a-new-view-using-sheets

import SwiftUI
import SwiftSoup

struct ExplanationView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = ComicViewModel()
    
    @State private var extractedText = ""
    
    var comic: Comic
    init(comic: Comic) {
        self.comic = comic
    }

    var body: some View {
        
        let url = URL(string: "https://www.explainxkcd.com/wiki/index.php/\(comic.num)")!
        
        VStack {
            Text("Explanation of \(comic.title)")
                .padding().font(.headline)
            
            ScrollView {
                Text(extractedText).padding()
                    .onAppear {
                        viewModel.fetchExplanation(from: url) {
                            result in
                            switch result {
                            case .success(let html):
                                do {
                                    let doc = try SwiftSoup.parse(html)
                                    let paras = try doc.select("p")
                                    var explanation = ""
                                    
                                    for p: Element in paras {
                                        explanation += try p.text()
                                        explanation += "\n\n"
                                    }
                                    
                                    self.extractedText = explanation
                                } catch {
                                    print(error)
                                }
                            case .failure(let error):
                                print(error)
                            }
                        }
                    }
            }
            
    
         
            Button {
                dismiss()
            } label: {
                Image(systemName: "arrow.left")
                Text("Go back")
            }
            .font(.title)
            .padding()
            
            
        }
    
    }
}

struct ExplanationView_Previews: PreviewProvider {
    static var previews: some View {
        ExplanationView(comic: Comic(title: "title", num: 1, img: "img", alt: "text"))
            .environmentObject(ComicViewModel())
    }
}

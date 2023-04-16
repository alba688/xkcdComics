//
//  ComicViewModel.swift
//  Comic
//
//  Created by Alexandra Baker on 15/04/2023.
//

import Foundation
import SwiftUI
import SwiftSoup

class ComicViewModel: ObservableObject {
    
    @Published var comic = Comic(title: "Comic", num: 1, img: "Image", alt: "Alt")
    //@Published var explain = String("Some explanation")
    
    
   
    func fetchComic(comicNum: Int) {
        guard let url = URL(string: "https://xkcd.com/\(comicNum)/info.0.json") else {
            print("Invalid URL")
            // MARK: figure out how to give user feedback here
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self]
            data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            // convert to JSON
            do {
                let comic = try JSONDecoder().decode(Comic.self, from: data)
                DispatchQueue.main.async {
                    self?.comic = comic
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    func fetchExplanation(from url: URL, completion: @escaping(Result<String,Error>) -> Void) {
        URLSession.shared.dataTask(with: url) {
            data, _, error in
            guard let data = data else {
                if let error = error {
                    completion(.failure(error))
                }
                return
            }
            
            if let htmlString = String(data: data, encoding: .utf8) {
                completion(.success(htmlString))
            }
        }.resume()
    }
    
    
}

//
//  ComicViewModel.swift
//  Comic
//
//  Created by Alexandra Baker on 15/04/2023.
//

import Foundation
import SwiftUI

class ComicViewModel: ObservableObject {
    
    @Published var comic = Comic(title: "Comic", num: 1, img: "Image", alt: "Alt")
   
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
    
    
}

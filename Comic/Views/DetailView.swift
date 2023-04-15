//
//  DetailView.swift
//  Comic
//
//  Created by Alexandra Baker on 15/04/2023.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        VStack {
            Text("Detail View").font(.largeTitle)
            
            // Comic Area
            Text("Title")
            Image("")
                .frame(width: 300, height: 200)
                .background(Color.gray)
            Text("Explanation")
            HStack {
                Button("Favorite ❤️") {
                    //action here
                }.buttonStyle(.bordered).padding(.leading, 75.0)
                Spacer()
                Button("Share ⭐️") {
                    //action here
                }.buttonStyle(.bordered).padding(.trailing, 75.0)
                
            }
            
            Spacer()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}

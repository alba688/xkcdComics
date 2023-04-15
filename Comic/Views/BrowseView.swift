//
//  BrowseView.swift
//  Comic
//
//  Created by Alexandra Baker on 15/04/2023.
//

import SwiftUI

struct BrowseView: View {
    var body: some View {
        VStack {
            Text("Browse View").font(.largeTitle)
            
            // Comic Area
            Text("Title")
            Text("Comic Nr.")
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
        }
    }
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView()
    }
}

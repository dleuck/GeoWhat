//
//  ContentView.swift
//  GeoWhat
//
//  Created by Daniel Leuck on 2022/10/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            BrowserView()
                .tabItem {
                    Label("Browser", systemImage: "flag.circle")
                }
            QuizView()
                .tabItem {
                    Label("Quiz", systemImage: "questionmark.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


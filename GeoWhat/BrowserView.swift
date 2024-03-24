//
//  BrowserView.swift
//  GeoWhat
//
//  Created by Daniel Leuck on 2022/10/23.
//

import SwiftUI

struct BrowserView: View {
    
    @Environment(\.colorScheme) var colorScheme
    // @FocusState var searchIsFocused: Bool
    
    @State var flag: String = ""
    @State var searchText: String = ""
    @State var flagIndex: Int = 0
    
    var body: some View {
        VStack {
            searchField()
            
            Spacer()
            VStack(spacing: -35) {
                Text(flags[flagIndex].emoji).font(.system(size: 216))
                Text(flags[flagIndex].name).font(.system(size: 32))
            }
            .padding()
            flagStepper()
            Spacer()
        }
    }
    
    func searchField() -> some View {
        TextField(text: $searchText) {
            Text("Search")
        }
        // .focused($searchIsFocused)
        .textFieldStyle(.plain)
        .padding()
        .background(colorScheme == .dark ? rgb(40, 40, 40) : rgb(240, 240, 240))
        .cornerRadius(50.0)
        .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
        .font(.title2)
        .padding()
        .onChange(of: searchText) { newValue in
            var index = 0
            for flag in flags {
                if flag.name.localizedCaseInsensitiveContains(newValue) {
                    flagIndex = index
                }
                index += 1
            }
        }
    }
    
    func flagStepper() -> some View {
        HStack {
            Button("<") {
                if flagIndex > 0 {
                    flagIndex += -1
                }
            }.font(.system(size: 64, weight: .bold))
            hspace(30)
            Button(">") {
                if flagIndex < flags.count-1 {
                    flagIndex += 1
                }
            }.font(.system(size: 64, weight: .bold))
        }
    }
}

struct BrowserView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            BrowserView().preferredColorScheme($0)
        }
    }
}



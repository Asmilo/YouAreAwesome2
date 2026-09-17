//
//  ContentView.swift
//  YouAreAwesome2
//
//  Created by Michiel Nooij on 13/09/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("I am Awesome")
                .foregroundStyle(.red)
                .fontWeight(.bold)
                .font(.largeTitle)
            Image("image0")
                .resizable()
                .scaledToFit()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  ScoreKeeper
//
//  Created by Sarah Clark on 8/20/25.
//

import SwiftUI

struct ContentView: View {
    @State private var players: [String] = ["Rachel", "Orko", "Molly"]

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

// MARK: - Previews
#Preview("Dark Mode") {
    ContentView()
    .preferredColorScheme(.dark)
}

#Preview("Light Mode") {
    ContentView()
        .preferredColorScheme(.light)
}

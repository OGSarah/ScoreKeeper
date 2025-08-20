//
//  ContentView.swift
//  ScoreKeeper
//
//  Created by Sarah Clark on 8/20/25.
//

import SwiftUI

struct ContentView: View {
    @State private var players: [Player] = [
        Player(name: "Rachel", score: 0),
        Player(name: "Orko", score: 0),
        Player(name: "Molly", score: 0)
    ]

    var body: some View {
        VStack {
            ForEach($players) { $player in
                TextField("Name", text: $player.name)
                Stepper("\(player.score)", value: $player.score)
            }
            Button("Add Player", systemImage: "plus") {
                players.append(Player(name: "", score: 0))
            }
            Spacer()
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

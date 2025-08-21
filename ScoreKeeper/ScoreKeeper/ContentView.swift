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
        VStack(alignment: .leading) {
            Text("Score Keeper")
                .font(.title)
                .bold()
                .padding(.bottom)

            Grid {
                GridRow {
                    Text("Player")
                        .gridColumnAlignment(.leading)
                    Text("Score")
                }
                .font(.headline)

                ForEach($players) { $player in
                    GridRow {
                        TextField("Name", text: $player.name)
                        Text("\(player.score)")
                        Stepper("\(player.score)", value: $player.score)
                            .labelsHidden()
                    }
                }
            }
            .padding(.vertical)

            Button("Add Player", systemImage: "plus") {
                players.append(Player(name: "", score: 0))
            }
            .foregroundStyle(.white)
            .padding(10)
            .glassEffect(.regular.tint(.blue).interactive())

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

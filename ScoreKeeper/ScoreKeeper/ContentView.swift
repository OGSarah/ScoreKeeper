//
//  ContentView.swift
//  ScoreKeeper
//
//  Created by Sarah Clark on 8/20/25.
//

import SwiftUI

struct ContentView: View {
    @State private var scoreboard = Scoreboard()
    private var startingPoints = 0

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

                ForEach($scoreboard.players) { $player in
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
                scoreboard.players.append(Player(name: "", score: 0))
            }
            .foregroundStyle(.white)
            .padding(10)
            .glassEffect(.regular.tint(.blue).interactive())

            Spacer()

            switch scoreboard.state {
                case .setup:
                    Button("Start Game", systemImage: "play.fill") {
                        scoreboard.state = .playing
                        scoreboard.resetScores(to: startingPoints)
                    }
                    .foregroundStyle(.white)
                    .padding(10)
                    .glassEffect(.regular.tint(.blue).interactive())

                case .playing:
                    Button("End Game", systemImage: "stop.fill") {
                        scoreboard.state = .gameOver
                    }
                    .foregroundStyle(.white)
                    .padding(10)
                    .glassEffect(.regular.tint(.red).interactive())

                case .gameOver:
                    Button("Reset Game", systemImage: "arrow.counterclockwise") {
                        scoreboard.state = .setup
                    }
                    .foregroundStyle(.white)
                    .padding(10)
                    .glassEffect(.regular.tint(.yellow).interactive())
            }
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

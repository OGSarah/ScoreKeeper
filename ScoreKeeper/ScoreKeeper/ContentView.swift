//
//  ContentView.swift
//  ScoreKeeper
//
//  Created by Sarah Clark on 8/20/25.
//

import SwiftUI

struct ContentView: View {
    @State private var scoreboard = Scoreboard()
    @State private var startingPoints = 0

    var body: some View {
        VStack(alignment: .leading) {
            Text("Score Keeper")
                .font(.title)
                .bold()
                .padding(.bottom)

                SettingsView(doesHighestScoreWin: $scoreboard.doesHighestScoreWin, startingPoints: $startingPoints)
                    .disabled(scoreboard.state != .setup)

            Grid {
                GridRow {
                    Text("Player")
                        .gridColumnAlignment(.leading)
                    Text("Score")
                        .opacity(scoreboard.state == .setup ? 0 : 1.0)
                }
                .font(.headline)

                ForEach($scoreboard.players) { $player in
                    GridRow {
                        HStack {
                            if scoreboard.winners.contains(player) {
                                Image(systemName: "crown.fill")
                                    .foregroundStyle(.yellow)
                            }
                            TextField("Name", text: $player.name)
                        }
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
            .opacity(scoreboard.state == .setup ? 1.0 : 0)

            Spacer()

            HStack {
                Spacer()
                switch scoreboard.state {
                    case .setup:
                        Button("Start Game", systemImage: "play.fill") {
                            scoreboard.state = .playing
                            scoreboard.resetScores(to: startingPoints)
                        }
                        .controlSize(.large)
                        .foregroundStyle(.white)
                        .padding(10)
                        .glassEffect(.regular.tint(.blue).interactive())

                    case .playing:
                        Button("End Game", systemImage: "stop.fill") {
                            scoreboard.state = .gameOver
                        }
                        .controlSize(.large)
                        .foregroundStyle(.white)
                        .padding(10)
                        .glassEffect(.regular.tint(.red).interactive())

                    case .gameOver:
                        Button("Reset Game", systemImage: "arrow.counterclockwise") {
                            scoreboard.state = .setup
                        }
                        .controlSize(.large)
                        .foregroundStyle(.white)
                        .padding(10)
                        .glassEffect(.regular.tint(.yellow).interactive())
                }
                Spacer()
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

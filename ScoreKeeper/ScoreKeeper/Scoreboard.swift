//
//  Scoreboard.swift
//  ScoreKeeper
//
//  Created by Sarah Clark on 8/20/25.
//

import Foundation

struct Scoreboard {

    var players: [Player] = [
        Player(name: "Rachel", score: 0),
        Player(name: "Orko", score: 0),
        Player(name: "Molly", score: 0)
    ]

    var state = GameState.setup

    mutating func resetScores(to newValue: Int) {
        for index in 0..<players.count {
            players[index].score = newValue
        }
    }

}

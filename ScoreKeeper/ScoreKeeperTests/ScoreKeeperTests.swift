//
//  ScoreKeeperTests.swift
//  ScoreKeeperTests
//
//  Created by Sarah Clark on 8/20/25.
//

import Testing
@testable import ScoreKeeper

struct ScoreKeeperTests {

    @Test("Reset player scores", arguments: [0, 10, 20])
    func resetScores(to newValue: Int) async throws {
        var scoreboard = Scoreboard(players: [
            Player(name: "Rachel", score: 0),
            Player(name: "Orko", score: 5)
        ])
        await scoreboard.resetScores(to: newValue)

        for player in await scoreboard.players {
            #expect(player.score == newValue)
        }
    }

}

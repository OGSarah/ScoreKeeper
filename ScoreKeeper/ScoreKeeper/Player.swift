//
//  Player.swift
//  ScoreKeeper
//
//  Created by Sarah Clark on 8/20/25.
//

import Foundation

struct Player: Identifiable {
    let id = UUID()
    var name: String
    var score: Int
}

//
//  SoundData.swift
//  RhythmApp
//
//  Created by Sophie Strausberg on 3/12/23.
//

import Foundation

// let soundList = []

let easy1 = Sound(difficulty: .easy, soundFile: "Easy1", beatTiming: [0.0, 1.33, 2.74])
let easy2 = Sound(difficulty: .easy, soundFile: "Easy2", beatTiming: [0.0, 0.80, 1.45, 2.1, 2.75])
let easy3 = Sound(difficulty: .easy, soundFile: "Easy3", beatTiming: [0.0, 0.8, 1.28, 1.46, 2.04, 2.4])
let medium1 = Sound(difficulty: .medium, soundFile: "Medium1", beatTiming: [0.0, 0.7, 0.88, 1.59, 2.07, 2.23])
let medium2 = Sound(difficulty: .medium, soundFile: "Medium2", beatTiming: [0.0, 0.8, 1.0, 1.8, 2.0, 2.8]) //this sounds should prob be redone...
let medium3 = Sound(difficulty: .medium, soundFile: "Medium3", beatTiming: [0.0, 0.78, 1.27, 2.22, 3.42, 3.92])
let hard1 = Sound(difficulty: .hard, soundFile: "Hard1", beatTiming: [0.0, 0.59, 0.92, 1.25, 1.54, 1.72, 1.9, 2.24])
let hard2 = Sound(difficulty: .hard, soundFile: "Hard2", beatTiming: [0.0, 0.56, 0.87, 1.03, 1.19])
let hard3 = Sound(difficulty: .hard, soundFile: "Hard3", beatTiming: [0.0, 0.69, 0.85, 1.19, 1.52, 1.76, 2.06, 2.29])

let allSounds: [Difficulty: [Sound]] = [.easy: [easy1, easy2, easy3], .medium: [medium1, medium2, medium3], .hard: [hard1, hard2, hard3]]


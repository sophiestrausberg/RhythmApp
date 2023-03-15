//
//  SoundData.swift
//  RhythmApp
//
//  Created by Sophie Strausberg on 3/12/23.
//

import Foundation

// let soundList = []

let easy1 = Sound(difficulty: .easy, soundFile: "Easy1")
let easy2 = Sound(difficulty: .easy, soundFile: "Easy2")
let easy3 = Sound(difficulty: .easy, soundFile: "Easy3")
let medium1 = Sound(difficulty: .medium, soundFile: "Medium1")
let medium2 = Sound(difficulty: .medium, soundFile: "Medium2")
let medium3 = Sound(difficulty: .medium, soundFile: "Medium3")
let hard1 = Sound(difficulty: .hard, soundFile: "Hard1")
let hard2 = Sound(difficulty: .hard, soundFile: "Hard2")
let hard3 = Sound(difficulty: .hard, soundFile: "Hard3")

let allSounds: [Difficulty: [Sound]] = [.easy: [easy1, easy2, easy3], .medium: [medium1, medium2, medium3], .hard: [hard1, hard2, hard3]]


//
//  Sound.swift
//  RhythmApp
//
//  Created by Sophie Strausberg on 3/12/23.
//

import Foundation

enum Difficulty {
    case easy, medium, hard
}

struct Sound {
    var used = false
    var missed = 0
    let difficulty: Difficulty
    let soundFile: String
    let beatTiming: [Double] = [0.0] // FOR NOW
    
    init(difficulty: Difficulty, soundFile: String) {
        self.difficulty = difficulty
        self.soundFile = soundFile
    }
}

struct SoundConroller {
    
//
//    func playSound(_ soundFileName : String) {
//        if sound == false {             // Have a toggle to mute sound in app
//            guard let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: nil) else {
//                fatalError("Unable to find \(soundFileName) in bundle")
//            }
//
//            do {
//                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
//            } catch {
//                print(error.localizedDescription)
//            }
//            audioPlayer.play()
//        }
//    }
}

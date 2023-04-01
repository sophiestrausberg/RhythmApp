//
//  Sound.swift
//  RhythmApp
//
//  Created by Sophie Strausberg on 3/12/23.
//

import Foundation
import AVFoundation


enum Difficulty {
    case easy, medium, hard
}

struct Sound {
    var used = false
    var missed = 0
    let difficulty: Difficulty
    let soundFile: String
    let beatTiming: [Double] // FOR NOW
    
    init(difficulty: Difficulty, soundFile: String, beatTiming: [Double]) {
        self.difficulty = difficulty
        self.soundFile = soundFile
        self.beatTiming = beatTiming
    }
}


var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Could not find and play the sound file")
        }
    }
}

    
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


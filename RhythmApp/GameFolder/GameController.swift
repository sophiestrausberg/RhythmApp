//
//  GameController.swift
//  RhythmApp
//
//  Created by Sophie Strausberg on 3/12/23.
//

import Foundation
import SwiftUI

class GameController: ObservableObject {
    var timer = Timer()
    var timerExample = Timer()
    var soundQueue: Queue<Sound> = Queue()
    var timerLength: Double
    var secondElapsed = 0.0
    var correct: Bool? = nil
    @Published var userTapsArray = [0.0]
    var curSound: Sound? = nil

    var lastDateObserved = Date()
    
    //TAP TIMER
    var tapTimer: Timer?
    var tappedTimeOver = false
    var runCount = 0
    
    //TAPPED FUNC
    var numTaps = 0
    
    @objc func fireTimer() {
        print("Timer fired!")
        runCount += 1

        if runCount == 10 {
            timer.invalidate()
            tappedTimeOver = false
        }
    }

    
    init(_ timerLength: Double) {
        for (_, value) in allSounds {
            let index = Int.random(in: 0...value.count-1)
            soundQueue.enqueue(value[index])
        }
        
        self.timerLength = timerLength
        //_timerLength = State(initialValue: timerLength)

        print(soundQueue)
    
    }
    
    

    
    func runGame() {
        var success = false
        var audio = soundQueue.dequeue()
        curSound = audio
        
        //RUN GAME TIMER

        
        DispatchQueue.global(qos: .background).async {
            self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                print(self.secondElapsed)
                    self.secondElapsed += 1.0
                    
                    if self.secondElapsed == self.timerLength {
                        self.timer.invalidate()
                    }
                }
                RunLoop.current.run()
            }
        
//        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
//            self.secondElapsed += 1.0
//
//            if self.secondElapsed == self.timerLength {
//                timer.invalidate()
//            }
//        }
      //  print(self.secondElapsed)

        while self.secondElapsed < self.timerLength {
            //SetProgressBar(audio.beatTiming)
            //RunExample(audio)
            //success = RunTap(audio!)
           // showFeedback(success)
//            print(self.secondElapsed)
            print("Hello")
            
//            let currentDate = Date()
//            let currentAccumulatedTime = currentDate.timeIntervalSince(lastDateObserved)
//            self.secondElapsed +=  currentAccumulatedTime
//            lastDateObserved = currentDate
            
        }
        
        print(self.secondElapsed)
        
    }
    
    func runExample(_ difficulty: Difficulty, _ audio: String) {
        // turn the timer into a function?
        var secondElapsedThis = 0.0
        DispatchQueue.global(qos: .background).async {
            self.timerExample = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
             
                    secondElapsedThis += 0.01
                    
                if secondElapsedThis == 6.0 { //LETS MAKE EACH AUDIO LENGTH THE SAME
                        self.timerExample.invalidate()
                    }
                }
                RunLoop.current.run()
            }
        
        
        playSound(sound: audio, type: "mp3")
        //Can we make beatTiming into Int array? Should we have some sort of waiting period? Can we fill audiobeatTiming and add all of our audio?
        
        while secondElapsedThis < 6.0 {
            if Sound(difficulty: difficulty, soundFile: audio).beatTiming.contains(secondElapsedThis) {
                drumImage = "secondDrum"
            }
            if !Sound(difficulty: difficulty, soundFile: audio).beatTiming.contains(secondElapsedThis) { //convert to Int
                drumImage = "Drum"
            }
        }
        //background change or vibration
    }
    
    func RunTap(_ audio: Sound) -> Bool {
        let numBeats = audio.beatTiming.count
        tapTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
        
        while tappedTimeOver == false || numBeats > userTapsArray.count {
            //wait
        }
        
      let correct = checkCorrect(audio.beatTiming, userTapsArray)
        return correct
    }
    
    func checkCorrect(_ initialBeats: [Double], _ tappedBeats: [Double]) -> Bool {
        var copy: [Double] = []
        for beat in tappedBeats{
            copy.append(beat - tappedBeats[0])
        }

        for index in 0...initialBeats.count {
                if abs(initialBeats[index] - copy[index]) > 0.5 {
                    return false
                }
            }
        return true

    }
    
    func buttonTapped() {
        numTaps += 1
        //accuracy only to the second...
        userTapsArray.append(Double(self.secondElapsed))
    }
    
    func showFeedback(_ success: Bool) {
        var secondsElapsed = 0.0
        let feedbackTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                   self.secondElapsed += 1.0
                   
            if self.secondElapsed == 3 {
                    timer.invalidate()
            }
        }
        
        while secondsElapsed <= 3.0 {
                if success {
                        correct = true
                } else {
                        correct = false
                }
        }
        
        correct = nil
    }
    
}

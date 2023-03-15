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
    var soundQueue: Queue<Sound> = Queue()
    var timerLength: Double
    var secondElapsed = 0.0
    

    
    init(_ timerLength: Double) {
        for (_, value) in allSounds {
            let index = Int.random(in: 0...value.count-1)
            soundQueue.enqueue(value[index])
        }
        
        self.timerLength = timerLength
        //_timerLength = State(initialValue: timerLength)

        print(soundQueue)
        
        runGame()
    }
    
    
    func runGame() {
        var success = false
        var audio = soundQueue.dequeue()
        
        //RUN GAME TIMER
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.secondElapsed += 1.0
            
            if self.secondElapsed == self.timerLength {
                timer.invalidate()
            }
        }
        
        while self.secondElapsed != self.timerLength {
            //SetProgressBar(audio.beatTiming)
            //RunExample(audio)
            print(self.secondElapsed)
            
        }
        
    }
}

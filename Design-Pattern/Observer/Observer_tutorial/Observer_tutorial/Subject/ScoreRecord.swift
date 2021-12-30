//
//  ScoreRecord.swift
//  Observer_tutorial
//
//  Created by SHIN YOON AH on 2021/11/24.
//

import Foundation

class ScoreRecord: Subject {
    var observers: [Observer] = []
    
    private var scores: [Int] = []
    
    func addScore(_ score: Int) {
        self.scores.append(score)
        self.notifyObservers()
    }
    
    func getScoreRecord() -> [Int] {
        return self.scores
    }
}

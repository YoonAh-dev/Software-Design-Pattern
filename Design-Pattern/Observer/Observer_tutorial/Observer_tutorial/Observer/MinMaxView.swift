//
//  MinMaxView.swift
//  Observer_tutorial
//
//  Created by SHIN YOON AH on 2021/11/24.
//

import Foundation

class MinMaxView: Observer {
    private var scoreRecord: ScoreRecord
    
    init(scoreRecord: ScoreRecord) {
        self.scoreRecord = scoreRecord
    }
    
    func update() {
        let record = self.scoreRecord.getScoreRecord()
        displayScores(record: record)
    }
    
    private func displayScores(record: [Int]) {
        print("Min: \(record.min() ?? 0) Max: \(record.max() ?? 0)")
    }
}

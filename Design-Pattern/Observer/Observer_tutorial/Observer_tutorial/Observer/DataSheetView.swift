//
//  DataSheetView.swift
//  Observer_tutorial
//
//  Created by SHIN YOON AH on 2021/11/24.
//

import Foundation

class DataSheetView: Observer {
    private var scoreRecord: ScoreRecord
    private var viewCount: Int
    
    init(scoreRecord: ScoreRecord, viewCount: Int) {
        self.scoreRecord = scoreRecord
        self.viewCount = viewCount
    }
    
    func update() {
        let record = self.scoreRecord.getScoreRecord()
        displayScores(record: record, viewCount: self.viewCount)
    }
    
    private func displayScores(record: [Int], viewCount: Int) {
        print("List of \(min(viewCount, record.count)) entries")
        
        for i in 0..<min(viewCount, record.count) {
            print(record[i])
        }
    }
}

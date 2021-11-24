//
//  ViewController.swift
//  Observer_tutorial
//
//  Created by SHIN YOON AH on 2021/11/24.
//

import UIKit

// ScoreRecord가 가지고 있는 점수 리스트에 변동이 생길때마다 통보를 받음
class ViewController: UIViewController {
    
    var scoreRecord = ScoreRecord()
    
    lazy var dataSheetView = DataSheetView(scoreRecord: scoreRecord, viewCount: 3)
    lazy var minmaxView = MinMaxView(scoreRecord: scoreRecord)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreRecord.attach(observer: dataSheetView)
        scoreRecord.attach(observer: minmaxView)
        
        for i in 0...5 {
            let score = i * 10
            print("adding \(score)")
            scoreRecord.addScore(score)
        }
    }


}


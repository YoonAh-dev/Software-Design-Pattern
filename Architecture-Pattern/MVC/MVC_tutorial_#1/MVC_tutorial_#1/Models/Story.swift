//
//  Story.swift
//  MVC_tutorial_#1
//
//  Created by SHIN YOON AH on 2021/05/24.
//

import Foundation

// 버튼을 누를 때마다 다르게 나오는 title
// 버튼 2개를 나타낼 수 있는 choice1, choice2
// destination를 나타내는 choice1Destination, choice2Destination
struct Story {
    let title: String
    
    let choice1: String
    let choiceDestination: Int
    
    let choice2: String
    let choice2Destination: Int
}

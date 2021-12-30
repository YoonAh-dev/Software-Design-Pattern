//
//  StoryBrain.swift
//  MVC_tutorial_#1
//
//  Created by SHIN YOON AH on 2021/05/24.
//

import Foundation

struct StoryBrain {
    // 구조체 타입 배열 선언
    var stories: [Story] = [
        Story(title: "안촉촉한 초코칩 나라에 살던 안촉촉한 초코칩이 촉촉한 초코칩 나라의 촉촉한 초코칩을 보고 촉촉한 초코칩이 되고 싶어서 촉촉한 초코칩 나라에 갔는데 촉촉한 초코칩 나라의 촉촉한 초코칩 문지기가 넌 촉촉한 초코칩이 아니고 안촉촉한 초코칩이니까 안촉촉한 초코칩나라에서 살아 라고해서 안촉촉한 초코칩은 촉촉한 초코칩이 되는것을 포기하고 안촉촉한 초코칩 나라로 돌아갔다.", choice1: "안촉촉한 초코칩", choiceDestination: 2, choice2: "촉촉한 초코칩", choice2Destination: 1),
        Story(title: "어느날 한라산 산삼이 먹고 싶다며 나를 데려간 제주도에서 저기저 돌하르방 코는 아들 날 코인가", choice1: "아들", choiceDestination: 2, choice2: "딸", choice2Destination: 3),
        Story(title: "상표 붙인 큰 깡통은 깐 깡통인가? 안 깐 깡통인가?", choice1: "깐 깡통", choiceDestination: 4, choice2: "안 깐 깡통", choice2Destination: 5),
        Story(title: "멍멍이네 꿀꿀이는 멍멍해도 꿀꿀하고 꿀꿀이네 멍멍이는 꿀꿀해도 멍멍하다", choice1: "멍멍이", choiceDestination: 0, choice2: "꿀꿀이", choice2Destination: 0),
        Story(title: "멍멍이네 꿀꿀이는 멍멍해도 꿀꿀하고 꿀꿀이네 멍멍이는 꿀꿀해도 멍멍하다", choice1: "멍멍이", choiceDestination: 0, choice2: "꿀꿀이", choice2Destination: 0),
        Story(title: "멍멍이네 꿀꿀이는 멍멍해도 꿀꿀하고 꿀꿀이네 멍멍이는 꿀꿀해도 멍멍하다", choice1: "멍멍이", choiceDestination: 0, choice2: "꿀꿀이", choice2Destination: 0)
    ]
    
    // 필요한 변수와 함수 선언
    var storyNumber = 0
    
    func getStoryLabelText() -> String {
        return stories[storyNumber].title
    }
    
    func getChoiceButtonText() -> String {
        return stories[storyNumber].choice1
    }
    
    func getChoice2ButtonText() -> String {
        return stories[storyNumber].choice2
    }
    
    func getChoice1Destination() -> Int {
        return stories[storyNumber].choiceDestination
    }
    
    func getChoice2Destination() -> Int {
        return stories[storyNumber].choice2Destination
    }
    
    // 구조체 내부 값을 바꾸는 것이기 때문에 mutating 키워드가 필요
    mutating func changeStoryNumber(targetNumber: Int) {
        storyNumber = targetNumber
    }
}

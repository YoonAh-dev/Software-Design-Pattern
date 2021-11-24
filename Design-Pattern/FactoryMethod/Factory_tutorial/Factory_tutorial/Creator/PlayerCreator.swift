//
//  PlayerCreator.swift
//  Factory_tutorial
//
//  Created by SHIN YOON AH on 2021/11/24.
//

import Foundation

// Creator : 특정 프로토콜을 채택한 객체만 반환(Player)
protocol PlayerCreator {
    func createPlayer(content: String, contentType: ContentType) -> Player
}

enum ContentType {
    case music
    case video
}

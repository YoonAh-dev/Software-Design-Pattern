//
//  PlayerFactory.swift
//  Factory_tutorial
//
//  Created by SHIN YOON AH on 2021/11/24.
//

import Foundation

class PlayerFactory: PlayerCreator {
    func createPlayer(content: String, contentType: ContentType) -> Player {
        switch contentType {
        case .music:
            return MusicPlayer(content: content)
        case .video:
            return VideoPlayer(content: content)
        }
    }
}

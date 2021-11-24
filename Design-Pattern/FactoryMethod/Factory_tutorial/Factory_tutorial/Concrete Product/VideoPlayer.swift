//
//  VideoPlayer.swift
//  Factory_tutorial
//
//  Created by SHIN YOON AH on 2021/11/24.
//

import Foundation

// Concrete Product
class VideoPlayer: Player {
    var content: String
    
    required init(content: String) {
        self.content = content
    }
    
    func play() {
        print("VideoPlayer play")
    }
    
    func pause() {
        print("VideoPlayer Pause")
    }
    
    func changeContent(name: String) {
        print("\(self.content)에서 \(name)로 비디오 변경")
        self.content = name
    }
}

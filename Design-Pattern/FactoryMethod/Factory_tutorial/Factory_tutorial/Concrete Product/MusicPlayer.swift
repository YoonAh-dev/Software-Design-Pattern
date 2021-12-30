//
//  MusicPlayer.swift
//  Factory_tutorial
//
//  Created by SHIN YOON AH on 2021/11/24.
//

import Foundation

// Concrete Product
class MusicPlayer: Player {
    var content: String
    
    required init(content: String) {
        self.content = content
    }
    
    func play() {
        print("MusicPlayer Play")
    }
    
    func pause() {
        print("MusicPlayer Pause")
    }
    
    func changeContent(name: String) {
        print("\(self.content)에서 \(name)로 음악 변경")
        self.content = name
    }
}

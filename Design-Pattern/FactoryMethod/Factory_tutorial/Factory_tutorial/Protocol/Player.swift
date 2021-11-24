//
//  Player.swift
//  Factory_tutorial
//
//  Created by SHIN YOON AH on 2021/11/24.
//

import Foundation


// Product
protocol Player {
    var content: String { get set }
    
    init(content: String)
    
    func play()
    func pause()
    func changeContent(name: String)
}

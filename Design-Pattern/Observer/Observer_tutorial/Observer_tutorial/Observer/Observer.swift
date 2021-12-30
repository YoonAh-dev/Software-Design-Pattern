//
//  Observer.swift
//  Observer_tutorial
//
//  Created by SHIN YOON AH on 2021/11/24.
//

import Foundation

// Subject로부터 변경을 통보받을 메소드(추상메소드)
protocol Observer {
    func update()
}

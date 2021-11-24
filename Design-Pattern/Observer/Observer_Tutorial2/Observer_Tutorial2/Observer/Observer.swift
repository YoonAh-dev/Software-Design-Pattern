//
//  Observer.swift
//  Observer_Tutorial2
//
//  Created by SHIN YOON AH on 2021/11/24.
//

import Foundation

protocol Observer {
    var id: String { get set }
    func update(message: String)
}

//
//  MAUIComponent.swift
//  Factory_tutorial2
//
//  Created by SHIN YOON AH on 2021/11/24.
//

import UIKit

enum UIComponent {
    case label, button, textfield
}

protocol MAUIComponent {
    var component: UIComponent { get }
    var titleColor: CGColor { get set }
    var backColor: UIColor { get set }
}

//
//  ComponentFactory.swift
//  Factory_tutorial2
//
//  Created by SHIN YOON AH on 2021/11/24.
//

import UIKit

struct ComponentFactory {
    func make(_ component: UIComponent) -> MAUIComponent {
        switch component {
        case .label:
            return MALabel()
        case .button:
            return MAButton(titleColor: UIColor.systemGreen.cgColor)
        case .textfield:
            return MATextfield(backColor: .systemTeal)
        }
    }
}

//
//  MAButton.swift
//  Factory_tutorial2
//
//  Created by SHIN YOON AH on 2021/11/24.
//

import UIKit

final class MAButton: UIButton, MAUIComponent {
    var titleColor: CGColor
    
    var backColor: UIColor
    
    var component: UIComponent { .button }
    
    init(titleColor: CGColor = UIColor.label.cgColor,
         backColor: UIColor = .systemBackground) {
        self.titleColor = titleColor
        self.backColor = backColor
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

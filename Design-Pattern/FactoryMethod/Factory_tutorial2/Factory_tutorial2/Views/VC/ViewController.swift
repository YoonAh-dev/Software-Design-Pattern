//
//  ViewController.swift
//  Factory_tutorial2
//
//  Created by SHIN YOON AH on 2021/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    let factory = ComponentFactory()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = factory.make(.label)
        let button = factory.make(.button)
        let textField = factory.make(.textfield)
    }


}


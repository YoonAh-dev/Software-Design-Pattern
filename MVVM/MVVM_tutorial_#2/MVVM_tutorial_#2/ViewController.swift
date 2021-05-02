//
//  ViewController.swift
//  MVVM_tutorial_#2
//
//  Created by SHIN YOON AH on 2021/05/02.
//

import UIKit

class ViewController: UIViewController {
    let device = UIDevice.current

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print(device.model)
    }
}


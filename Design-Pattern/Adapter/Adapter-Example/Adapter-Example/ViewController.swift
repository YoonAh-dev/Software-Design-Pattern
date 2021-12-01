//
//  ViewController.swift
//  Adapter-Example
//
//  Created by SHIN YOON AH on 2021/12/01.
//

import UIKit

class ViewController: UIViewController {
    
    let adaptee = Adaptee()
    let target = OldDeathStarSuperLaserTarget(angleHorizontal: 14.0, angleVertical: 12.0)
    lazy var newFormat = NewDeathStarSuperLaserTarget(target)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Adaptee's specificRequest
        print(adaptee.specificRequest())
        
        /// Call from adapter
        Client.specificRequest(target: Adapter(adaptee))
        
        /// newformat
        print("angleH", newFormat.angleH)
        print("angleV", newFormat.angleV)
    }


}


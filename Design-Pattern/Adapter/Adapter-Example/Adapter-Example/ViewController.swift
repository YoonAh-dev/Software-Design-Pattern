//
//  ViewController.swift
//  Adapter-Example
//
//  Created by SHIN YOON AH on 2021/12/01.
//

import UIKit

class ViewController: UIViewController {
    
    let adaptee = Adaptee()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Adaptee's specificRequest
        print(adaptee.specificRequest())
        
        /// Call from adapter
        Client.specificRequest(target: Adapter(adaptee))
    }


}


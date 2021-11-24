//
//  ViewController.swift
//  Observer_Tutorial2
//
//  Created by SHIN YOON AH on 2021/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    let store = AppleStore(observers: [])
    let yoonah = Customer(id: "YoonAh")
    let duna = Customer(id: "Duna")
    let hamzza = Customer(id: "HamZZaGi")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.subscribe(observer: yoonah)
        store.subscribe(observer: hamzza)
        
        store.notify(message: "iPhone13 재고 입고!")
        
        store.unSubscribe(observer: hamzza)
        
        store.notify(message: "iMac Blue 컬러 재고 입고!")
    }


}


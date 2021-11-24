//
//  ViewController.swift
//  Factory_tutorial
//
//  Created by SHIN YOON AH on 2021/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Player Factory
    
    let factory = PlayerFactory()
    lazy var musicPlayer = factory.createPlayer(content: "Call Me Baby", contentType: .music)
    lazy var videoPlayer = factory.createPlayer(content: "Savage MV", contentType: .video)
    
    // MARK: - Currency Factory
    
    let noCurrencyCode = "No Currency Code Available"

    override func viewDidLoad() {
        super.viewDidLoad()
    
        musicPlayer.play()
        musicPlayer.changeContent(name: "Cold Blooded")
        
        videoPlayer.play()
        videoPlayer.changeContent(name: "Lovesick Girl MV")
        
        musicPlayer.pause()
        videoPlayer.pause()
        
        print(CurrencyFactory.currency(for: .greece)?.code ?? noCurrencyCode) // EUR
        print(CurrencyFactory.currency(for: .uk)?.code ?? noCurrencyCode) // No Currency Code Available
    }
}


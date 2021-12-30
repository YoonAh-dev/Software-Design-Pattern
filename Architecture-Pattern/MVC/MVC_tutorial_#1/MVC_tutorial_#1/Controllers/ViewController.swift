//
//  ViewController.swift
//  MVC_tutorial_#1
//
//  Created by SHIN YOON AH on 2021/05/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var storyBrain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        updateUI()
    }
    
    @IBAction func choiceMade(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let choice1 = storyBrain.getChoiceButtonText()
        let choice2 = storyBrain.getChoice2ButtonText()
        
        if userAnswer == choice1 {
            storyBrain.changeStoryNumber(targetNumber: storyBrain.getChoice1Destination())
        } else if userAnswer == choice2 {
            storyBrain.changeStoryNumber(targetNumber: storyBrain.getChoice2Destination())
        }
        
        updateUI()
    }
    
    func configureUI() {
        choice1Button.backgroundColor = .systemPink
        choice2Button.backgroundColor = .systemPurple
        choice1Button.layer.cornerRadius = 15
        choice2Button.layer.cornerRadius = 15
        view.backgroundColor = UIColor(patternImage: UIImage(named: "background") ?? .checkmark)
    }
    
    func updateUI() {
        storyLabel.text = storyBrain.getStoryLabelText()
        choice1Button.setTitle(storyBrain.getChoiceButtonText(), for: .normal)
        choice2Button.setTitle(storyBrain.getChoice2ButtonText(), for: .normal)
    }
}


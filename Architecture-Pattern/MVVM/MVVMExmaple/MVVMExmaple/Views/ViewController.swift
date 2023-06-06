//
//  ViewController.swift
//  MVVMExmaple
//
//  Created by SHIN YOON AH on 2023/05/31.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var helloLabel: UILabel!

    private var viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel()
    }

    func bindViewModel() {
        self.viewModel.helloText.bind { text in
            self.helloLabel.text = text
        }
    }

    @IBAction func sayHelloButtonPressed(_ sender: UIButton) {
        self.viewModel.userTriggerSayHelloButton()
    }
}


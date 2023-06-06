//
//  ViewController.swift
//  Two-Way-Binding-MVVM
//
//  Created by SHIN YOON AH on 2023/05/31.
//

import UIKit

protocol PurpleButtonDelegate: AnyObject {
    func updateText(_ text: String)
}

final class ViewController: UIViewController {

    // MARK: - ui component

    @IBOutlet weak var descriptionLabel: UILabel!

    // MARK: - property

    private let purpleViewModel = PurpleViewModel()
    private let redViewModel = RedViewModel()
    private let greyViewModel = GreyViewModel()

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: - Purple Button
        self.purpleViewModel.delegate = self
        // MARK: - Red Button, Grey Button
        self.bindViewModel()
    }

    // MARK: - func

    private func bindViewModel() {
        self.redViewModel.text.bind { text in
            self.descriptionLabel.text = text
        }
    }

    // MARK: - IBAction

    @IBAction func didTapPurpleButton(_ sender: Any) {
        self.purpleViewModel.updateText()
    }

    @IBAction func didTapRedButton(_ sender: Any) {
        self.redViewModel.updateText()
    }

    @IBAction func didTapGreyButton(_ sender: Any) {
        self.greyViewModel.text.bind(\String.self, to: self.descriptionLabel, \.text)
    }
}

extension ViewController: PurpleButtonDelegate {
    func updateText(_ text: String) {
        self.descriptionLabel.text = text
    }
}


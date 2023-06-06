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

    private let viewModel = ViewModel()

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: - Purple Button
        self.viewModel.delegate = self
    }

    // MARK: - IBAction

    @IBAction func didTapPurpleButton(_ sender: Any) {
//        self.viewModel.updateText()
    }

    @IBAction func didTapRedButton(_ sender: Any) {

    }

    @IBAction func didTapGreyButton(_ sender: Any) {

    }
}

extension ViewController: PurpleButtonDelegate {
    func updateText(_ text: String) {
        self.descriptionLabel.text = text
    }
}

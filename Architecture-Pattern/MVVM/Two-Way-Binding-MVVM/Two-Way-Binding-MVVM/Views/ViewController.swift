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

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: - Purple Button
        self.purpleViewModel.delegate = self
        // MARK: - Red Button
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

    }
}

extension ViewController: PurpleButtonDelegate {
    func updateText(_ text: String) {
        self.descriptionLabel.text = text
    }
}

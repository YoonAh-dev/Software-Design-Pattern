//
//  MovieDetailsViewController.swift
//  ExampleMVVM
//
//  Created by Oleh Kudinov on 04.08.19.
//  Copyright (c) 2019 Company All rights reserved.
//

import UIKit
import Common

public final class MovieDetailsViewController: UIViewController, StoryboardInstantiable {
    
    private let fadeTransitionDuration: CFTimeInterval = 0.4
    
    @IBOutlet weak private var posterImageView: UIImageView!
    @IBOutlet weak private var overviewTextView: UITextView!
    
    public var viewModel: MovieDetailsViewModel!
    
    public class func create(with viewModel: MovieDetailsViewModel) -> MovieDetailsViewController {
        let view = instantiateViewController(Bundle(for: MovieDetailsViewController.self))
        view.viewModel = viewModel
        return view
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        bind(to: viewModel)
        viewModel.viewDidLoad()
        
        view.accessibilityLabel = NSLocalizedString("Movie details view", comment: "")
    }
    
    private func bind(to viewModel: MovieDetailsViewModel) {
        viewModel.title.observe(on: self) { [unowned self] title in
            self.title = title
        }
        viewModel.posterImage.observe(on: self) { [unowned self] image in
            self.posterImageView.image = image.flatMap { UIImage(data: $0) }
        }
        viewModel.overview.observe(on: self) { [unowned self] text in
            self.overviewTextView.setTextWithFadeTransition(text: text, withFadeTransitionDuration: self.fadeTransitionDuration)
        }
    }
    
    public override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        viewModel.updatePosterImage(width: Int(self.posterImageView.bounds.width))
    }
}

fileprivate extension UITextView {
    
    func setTextWithFadeTransition(text: String, withFadeTransitionDuration fadeTransitionDuration: CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.fade
        animation.duration = fadeTransitionDuration
        layer.add(animation, forKey: CATransitionType.fade.rawValue)
        self.text = text
    }
}

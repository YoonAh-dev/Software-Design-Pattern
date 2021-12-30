//
//  SuggestionsItemCell.swift
//  ExampleMVVM
//
//  Created by Oleh on 03.10.18.
//

import Foundation
import UIKit

class MoviesQueriesItemCell: UITableViewCell {
    
    static let reuseIdentifier = String(describing: MoviesQueriesItemCell.self)
    
    @IBOutlet weak private var titleLabel: UILabel!
    
    func fill(with suggestion: MoviesQueryListViewModel.Item) {
        self.titleLabel.text = suggestion.query
    }
}

//
//  PersonFollowingTableViewCellViewModel.swift
//  MVVM_tutorial_#1
//
//  Created by SHIN YOON AH on 2021/04/29.
//

import UIKit

struct PersonFollowingTableViewCellViewModel {
    let name: String
    let username: String
    var currentlyFollowing: Bool
    let image: UIImage?
    
    init(with model: Person) {
        name = model.name
        username = model.username
        currentlyFollowing = false
        image = UIImage(systemName: "person")
    }
}

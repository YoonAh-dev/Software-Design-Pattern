//
//  PersonFollowingTableViewCell.swift
//  MVVM_tutorial_#1
//
//  Created by SHIN YOON AH on 2021/04/29.
//

import UIKit

protocol PersonFollowingTableViewCellDelegate: AnyObject {
    func personFollowingTableViewCell(
        _ cell: PersonFollowingTableViewCell,
        didTapWith viewModel: PersonFollowingTableViewCellViewModel
    )
}

class PersonFollowingTableViewCell: UITableViewCell {
    static let identifier = "PersonFollowingTableViewCell"
    
    weak var delegate: PersonFollowingTableViewCellDelegate?
    
    private var viewModel: PersonFollowingTableViewCellViewModel?
    
    // 코드로 속성 잡아주기
    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        return label
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        return button
    }()

    // Initializes a table cell with a style and a reuse identifier and returns it to the caller.
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(userImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(button)
        contentView.clipsToBounds = true
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    @objc private func didTapButton() {
        guard let viewModel = viewModel else {
            return
        }
        var newViewModel = viewModel
        newViewModel.currentlyFollowing = !viewModel.currentlyFollowing
        
        delegate?.personFollowingTableViewCell(self, didTapWith: viewModel)
        
        prepareForReuse()
        configure(with: newViewModel)
    }
    
    // viewModel에서 viewModel의 데이터를 가져와서 cell 속성들에 넣어줌
    func configure(with viewModel: PersonFollowingTableViewCellViewModel) {
        self.viewModel = viewModel
        nameLabel.text = viewModel.name
        usernameLabel.text = viewModel.username
        userImageView.image = viewModel.image
        
        if viewModel.currentlyFollowing {
            button.setTitle("unfollow", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
        } else {
            button.setTitle("follow", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .link
        }
    }
    
    // 하위 뷰를 그릴 때 호출되는 함수
    override func layoutSubviews() {
        super.layoutSubviews()
        let imageWidth = contentView.frame.size.height - 10
        userImageView.frame = CGRect(x: 5, y: 5, width: imageWidth, height: imageWidth)
        nameLabel.frame = CGRect(x: imageWidth+10, y: 0, width: contentView.frame.size.width-imageWidth, height: contentView.frame.size.height/2)
        usernameLabel.frame = CGRect(x: imageWidth+10, y: contentView.frame.size.height/2, width: contentView.frame.size.width-imageWidth, height: contentView.frame.size.height/2)
        button.frame = CGRect(x: contentView.frame.size.width-120, y: 10, width: 110, height: contentView.frame.size.height-20)
    }
    
    // Prepares a reusable cell for reuse by the table view's delegate
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        usernameLabel.text = nil
        userImageView.image = nil
        button.backgroundColor = nil
        button.layer.borderWidth = 0
        button.setTitle(nil, for: .normal)
    }
}

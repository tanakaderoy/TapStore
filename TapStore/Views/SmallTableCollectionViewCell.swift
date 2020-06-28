//
//  SmallTableCollectionViewCell.swift
//  TapStore
//
//  Created by Tanaka Mazivanhanga on 6/27/20.
//  Copyright © 2020 Tanaka Mazivanhanga. All rights reserved.
//

import UIKit

class SmallTableCollectionViewCell: UICollectionViewCell, SelfConfiguringCell {
    static let reuseIdentifier: String = "SmallTableCollectionViewCell"

    let nameLabel = UILabel()
    let imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        nameLabel.font = .preferredFont(forTextStyle: .title2)
        nameLabel.textColor = .label

        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit

        let separator = UIView(frame: .zero)

        let innerStackView = UIStackView(arrangedSubviews: [imageView, nameLabel])
        innerStackView.axis = .horizontal
        innerStackView.alignment = .center
        innerStackView.spacing = 20

        contentView.addSubview(innerStackView)
        innerStackView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)

        NSLayoutConstraint.activate([
//            separator.heightAnchor.constraint(equalToConstant: 1),

            innerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            innerStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            innerStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])

    }


    func configure(with app:App){
        nameLabel.text = app.name
        imageView.image = UIImage(named: app.image)
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

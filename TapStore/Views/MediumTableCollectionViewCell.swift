//
//  MediumTableCollectionViewCell.swift
//  TapStore
//
//  Created by Tanaka Mazivanhanga on 6/27/20.
//  Copyright © 2020 Tanaka Mazivanhanga. All rights reserved.
//

import UIKit

class MediumTableCollectionViewCell: UICollectionViewCell, SelfConfiguringCell {
    static let reuseIdentifier: String = "MeduimYableCell"
    let name = UILabel()
    let buyButton = UIButton(type: .custom)
    let subtitle = UILabel()
    let imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        name.font = .preferredFont(forTextStyle: .headline)
        name.textColor = .label
        subtitle.font = .preferredFont(forTextStyle: .subheadline)

        subtitle.textColor = .secondaryLabel


        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit

        buyButton.setImage(UIImage(systemName: "icloud.and.arrow.down"), for: .normal)

        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        buyButton.setContentHuggingPriority(.defaultHigh, for: .horizontal)

        let innerStackView = UIStackView(arrangedSubviews: [name,subtitle])
        innerStackView.axis = .vertical

        let outerStackView = UIStackView(arrangedSubviews: [imageView, innerStackView, buyButton])
        outerStackView.axis = .horizontal
        outerStackView.translatesAutoresizingMaskIntoConstraints = false
        outerStackView.alignment = .center
        contentView.addSubview(outerStackView)
        NSLayoutConstraint.activate([
            outerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            outerStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            outerStackView.topAnchor.constraint(equalTo: contentView.topAnchor)
        ])
        outerStackView.spacing = 10

    }



    func configure(with app: App) {
        name.text = app.name
        subtitle.text = app.subheading
        imageView.image = UIImage(named: app.image)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

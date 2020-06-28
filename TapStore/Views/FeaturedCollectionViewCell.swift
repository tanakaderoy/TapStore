//
//  FeaturedCollectionViewCell.swift
//  TapStore
//
//  Created by Tanaka Mazivanhanga on 6/27/20.
//  Copyright © 2020 Tanaka Mazivanhanga. All rights reserved.
//

import UIKit

class FeaturedCollectionViewCell: UICollectionViewCell, SelfConfiguringCell {
    static let reuseIdentifier: String = "FeaturedCell"
    let name = UILabel()
    let tagline = UILabel()
    let subtitle = UILabel()
    let imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        let seperator = UIView(frame: .zero)
        seperator.translatesAutoresizingMaskIntoConstraints = false
        seperator.backgroundColor = .quaternaryLabel

        tagline.font = UIFontMetrics.default.scaledFont(for: .systemFont(ofSize: 12,weight: .bold))
        tagline.textColor = .systemBlue

        name.font = .preferredFont(forTextStyle: .title2)
        name.textColor = .label

        subtitle.font = .preferredFont(forTextStyle: .title3)
        subtitle.textColor = .secondaryLabel

        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        let stackView = UIStackView(arrangedSubviews: [seperator,tagline, name, subtitle, imageView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        contentView.addSubview(stackView)
        NSLayoutConstraint.activate([
            seperator.heightAnchor.constraint(equalToConstant: 1),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)

        ])
        stackView.setCustomSpacing(10, after: seperator)
        stackView.setCustomSpacing(10, after: subtitle)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func configure(with app: App) {
        name.text = app.name
        tagline.text = app.tagline.uppercased()
        subtitle.text = app.subheading
        imageView.image = UIImage(named: app.image)

    }

    
}

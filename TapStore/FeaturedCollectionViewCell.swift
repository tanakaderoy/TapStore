//
//  FeaturedCollectionViewCell.swift
//  TapStore
//
//  Created by Tanaka Mazivanhanga on 6/27/20.
//  Copyright © 2020 Tanaka Mazivanhanga. All rights reserved.
//

import UIKit

class FeaturedCollectionViewCell: UICollectionViewCell, SelfConfiguringCell {
    static var reuseIdentifier: String = "FeaturedCell"
    let name = UILabel()
    let tagline = UILabel()
    let subtile = UILabel()
    let imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        tagline.font = UIFontMetrics.default.scaledFont(for: .systemFont(ofSize: 12,weight: .bold))
        tagline.textColor = .systemBlue

        name.font = .preferredFont(forTextStyle: .title2)
        name.textColor = .label

        subtile.font = .preferredFont(forTextStyle: .title2)
        subtile.textColor = .secondaryLabel

        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        let stackView = UIStackView(arrangedSubviews: [tagline, name, subtile, imageView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        contentView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)

        ])

        stackView.setCustomSpacing(10, after: subtile)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func configure(with app: App) {
        name.text = app.name
        tagline.text = app.tagline.uppercased()
        subtile.text = app.subheading
        imageView.image = UIImage(named: app.image)

    }

    
}

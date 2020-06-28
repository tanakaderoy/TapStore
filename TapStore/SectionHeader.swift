//
//  SectionHeader.swift
//  TapStore
//
//  Created by Tanaka Mazivanhanga on 6/27/20.
//  Copyright © 2020 Tanaka Mazivanhanga. All rights reserved.
//

import UIKit

class SectionHeader: UICollectionReusableView {
    static let  reuseIdentifier = "SectionHeader"
    let title = UILabel()
    let subTitle = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        let separator = UIView(frame: .zero)
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .quaternaryLabel

        title.font = UIFontMetrics.default.scaledFont(for: .systemFont(ofSize: 22, weight: .bold))
        title.textColor = .label

        subTitle.textColor = .secondaryLabel

        let stackView = UIStackView(arrangedSubviews: [separator, title, subTitle])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)

        NSLayoutConstraint.activate([
            separator.heightAnchor.constraint(equalToConstant: 1),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
        stackView.setCustomSpacing(10, after: separator)
    }



    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

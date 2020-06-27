//
//  Section.swift
//  TapStore
//
//  Created by Tanaka Mazivanhanga on 6/27/20.
//  Copyright © 2020 Tanaka Mazivanhanga. All rights reserved.
//

import Foundation

struct Section: Decodable, Hashable {
    let id: Int
    let type: SectionType
    let title: String
    let subtitle: String
    let items: [App]
}

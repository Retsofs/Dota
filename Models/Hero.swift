//
//  Hero.swift
//  Dota
//
//  Created by Макаров Иван on 19/08/2019.
//  Copyright © 2019 123. All rights reserved.
//

import Foundation

struct Hero: Codable {
    let id: Int
    let name: String
    let localized_name: String
    let primary_attr: String
    let attack_type: String
    let roles: [String]
}

//
//  Movie.swift
//  s83_Theater
//
//  Created by Taehyeon Jake Lee on 06/07/2019.
//  Copyright © 2019 Taehyeon Jake Lee. All rights reserved.
//

import Foundation

struct Movie: Equatable {
    let name: String
    let price: Int
    init(name: String, price: Int) {
        self.name = name
        self.price = price
    }
}

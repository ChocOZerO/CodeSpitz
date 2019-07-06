//
//  Ticket.swift
//  s83_Theater
//
//  Created by Taehyeon Jake Lee on 06/07/2019.
//  Copyright © 2019 Taehyeon Jake Lee. All rights reserved.
//

import Foundation

class Ticket {
    let theater: Theater
    let movie: Movie
    private var isEntered = false
    init(theater: Theater, movie: Movie) {
        self.theater = theater
        self.movie = movie
    }

    func isValid(theater: Theater) -> Bool {
        guard !isEntered, theater == self.theater else { return false }
        isEntered = true
        return true
    }

    func getPrice() -> Int {
        return movie.price
    }
}

class Invitation {
    let theater: Theater
    let movie: Movie
    init(theater: Theater, movie: Movie) {
        self.theater = theater
        self.movie = movie
    }
}

//
//  Theater.swift
//  s83_Theater
//
//  Created by Taehyeon Jake Lee on 06/07/2019.
//  Copyright © 2019 Taehyeon Jake Lee. All rights reserved.
//

import Foundation

class Theater: Equatable {
    static func == (lhs: Theater, rhs: Theater) -> Bool {
        return lhs.name == rhs.name
    }

    private var ticketOffices = [TicketOffice]()
    private var movies = [Movie]()
    let name: String
    init(name: String) {
        self.name = name
    }

    func getPrice(movie: Movie) -> Int? {
        guard movies.contains(movie) else { return nil }
        return movie.price
    }

    func setTicketOffices(_ ticketOffices: [TicketOffice]) {
        self.ticketOffices = ticketOffices
    }

    func setMovies(_ movies: [Movie]) {
        self.movies = movies
    }

    func setTicket(ticketOffice: TicketOffice, count: Int, for movie: Movie) {
        guard ticketOffices.contains(ticketOffice), movies.contains(movie) else { return }
        for _ in stride(from: count, to: 0, by: -1) { ticketOffice.addTicket(Ticket(theater: self, movie: movie)) }
    }

    func setInvitation(audience: Audience, movie: Movie) {
        audience.setInvitation(Invitation(theater: self, movie: movie))
    }

    func enter(audience: Audience) -> Bool {
        guard let ticket = audience.getTicket() else { return false }
        return ticket.isValid(theater: self)
    }
}

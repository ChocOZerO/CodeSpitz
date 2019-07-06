//
//  TicketOffice.swift
//  s83_Theater
//
//  Created by Taehyeon Jake Lee on 06/07/2019.
//  Copyright © 2019 Taehyeon Jake Lee. All rights reserved.
//

import Foundation

class TicketOffice: Equatable {
    static func == (lhs: TicketOffice, rhs: TicketOffice) -> Bool {
        return lhs.theater.name == rhs.theater.name
    }

    let theater: Theater
    private var tickets = [Ticket]()
    private var amount: Int

    init(theater: Theater, amount: Int) {
        self.theater = theater
        self.amount = amount
    }

    func addTicket(_ ticket: Ticket) {
        self.tickets.append(ticket)
    }

    func getTicketWithFee(_ movie: Movie) -> Ticket? {
        guard let idx = tickets.firstIndex(where: { $0.movie == movie }) else { return nil }
        let ticket = tickets.remove(at: idx)
        amount += ticket.getPrice()
        return ticket
    }

    func getTicketWithoutFee(_ movie: Movie) -> Ticket? {
        guard let idx = tickets.firstIndex(where: { $0.movie == movie }) else { return nil }
        return tickets.remove(at: idx)
    }

    func getTicketPrice(_ movie: Movie) -> Int? {
        guard let ticket = tickets.filter({ $0.movie == movie }).first else { return nil }
        return ticket.getPrice()
    }
}

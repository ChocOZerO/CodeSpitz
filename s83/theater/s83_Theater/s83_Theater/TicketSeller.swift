//
//  TicketSeller.swift
//  s83_Theater
//
//  Created by Taehyeon Jake Lee on 06/07/2019.
//  Copyright © 2019 Taehyeon Jake Lee. All rights reserved.
//

import Foundation

class TicketSeller {
    private var ticketOffice: TicketOffice?
    func setTicketOffice(_ ticketOffice: TicketOffice) {
        self.ticketOffice = ticketOffice
    }

    func getTicket(audience: Audience, movie: Movie) -> Ticket? {
        guard let ticketOffice = self.ticketOffice, let price = ticketOffice.getTicketPrice(movie) else { return nil }
        if let invitation = audience.getInvitation(), invitation.movie == movie, let ticket = ticketOffice.getTicketWithoutFee(movie) {
            audience.removeInvitation()
            return ticket
        }
        if audience.hasAmount(price), let ticket = ticketOffice.getTicketWithFee(movie), audience.minusAmount(price) {
            return ticket
        }
        return nil
    }
}

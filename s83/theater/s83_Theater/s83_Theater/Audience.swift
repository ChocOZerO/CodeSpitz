//
//  Audience.swift
//  s83_Theater
//
//  Created by Taehyeon Jake Lee on 06/07/2019.
//  Copyright © 2019 Taehyeon Jake Lee. All rights reserved.
//

import Foundation

class Audience {
    private var invitation: Invitation?
    private var ticket: Ticket?

    private var amount: Int
    init(amount: Int) {
        self.amount = amount
    }

    func buyTicket(seller: TicketSeller, movie: Movie) {
        ticket = seller.getTicket(audience: self, movie: movie)
    }

    func getTicket() -> Ticket? {
        return self.ticket
    }

    func hasAmount(_ amount: Int) -> Bool {
        return self.amount >= amount
    }

    func minusAmount(_ amoun: Int) -> Bool {
        guard self.amount >= amount else { return false }
        self.amount -= amount
        return true
    }

    func getInvitation() -> Invitation? {
        return self.invitation
    }
    func setInvitation(_ invitation: Invitation) {
        self.invitation = invitation
    }
    func removeInvitation() {
        self.invitation = nil
    }
}

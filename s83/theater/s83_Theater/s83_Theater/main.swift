//
//  main.swift
//  s83_Theater
//
//  Created by Taehyeon Jake Lee on 06/07/2019.
//  Copyright © 2019 Taehyeon Jake Lee. All rights reserved.
//

import Foundation

let cgv = Theater(name: "CGV")
let spiderMan = Movie.init(name: "SpiderMan", price: 10000)
let lionKing = Movie.init(name: "LionKing", price: 9000)
let ticketOffice = TicketOffice(theater: cgv, amount: 0)

let seller = TicketSeller()
seller.setTicketOffice(ticketOffice)

let audience1 = Audience(amount: 8000)
let audience2 = Audience(amount: 15000)

cgv.setTicketOffices([ticketOffice])
cgv.setMovies([spiderMan, lionKing])
cgv.setTicket(ticketOffice: ticketOffice, count: 500, for: spiderMan)
cgv.setTicket(ticketOffice: ticketOffice, count: 300, for: lionKing)
cgv.setInvitation(audience: audience1, movie: lionKing)

audience1.buyTicket(seller: seller, movie: spiderMan)
audience2.buyTicket(seller: seller, movie: lionKing)

let isOK1 = cgv.enter(audience: audience1)
let isOK2 = cgv.enter(audience: audience2)

print(isOK1) // false -> 돈이 없고 invitation을 lionKing 을 받았는데 spiderMan을 보고 싶어함
print(isOK2) // true 돈이 많음

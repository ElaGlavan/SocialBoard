//
//  UserDetails.swift
//  SocialBoard
//
//  Created by Mihaela Glavan on 10/08/2020.
//  Copyright © 2020 Mihaela Glavan. All rights reserved.
//

import Foundation

struct UserDetailsResults: Decodable {
    var results: [UserDetails]
}

struct UserDetails: Decodable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: Address
    let phone: String
    let website: String
    let company: Company
}

struct Address: Decodable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Geo
}

struct Geo: Decodable {
    let lat: String
    let lng: String
}

struct Company: Decodable {
    let name: String
}




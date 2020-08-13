//
//  DecodeResults.swift
//  SocialBoard
//
//  Created by Mihaela Glavan on 10/08/2020.
//  Copyright © 2020 Mihaela Glavan. All rights reserved.
//

import Foundation

struct DecodeResults: Decodable {
    var results: [Users]
}

struct Users: Decodable {
    let name: String
    let username: String
}

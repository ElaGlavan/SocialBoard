//
//  Comments.swift
//  SocialBoard
//
//  Created by Mihaela Glavan on 12/08/2020.
//  Copyright © 2020 Mihaela Glavan. All rights reserved.
//

import Foundation

struct Comments {
    let comments: [Comment]
}

struct Comment: Decodable {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}

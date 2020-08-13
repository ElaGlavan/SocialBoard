//
//  Posts.swift
//  SocialBoard
//
//  Created by Mihaela Glavan on 12/08/2020.
//  Copyright © 2020 Mihaela Glavan. All rights reserved.
//

import Foundation

struct Posts: Decodable {
    let posts: [Post]
}

struct Post: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

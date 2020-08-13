//
//  UserDetailsViewModel.swift
//  SocialBoard
//
//  Created by Mihaela Glavan on 10/08/2020.
//  Copyright © 2020 Mihaela Glavan. All rights reserved.
//

import Foundation

struct UserDetailsViewModel {
    let users: [UserDetailsVM]
}

struct UserDetailsVM {
    let fullName: String
    let userName: String
    let email: String
    let street: String
    let suite: String
    let city: String
    let zipCode: String
    let phone: String
    let website: String
    let company: String
    let lat: String
    let lng: String
    let posts: [Post]
    let comments: [Int: Int]
}




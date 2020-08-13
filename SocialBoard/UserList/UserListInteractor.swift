//
//  UserListInteractor.swift
//  SocialBoard
//
//  Created by Mihaela Glavan on 10/08/2020.
//  Copyright © 2020 Mihaela Glavan. All rights reserved.
//

import Foundation

protocol UserListInteractorType {
    func fetchUsers(for endpoint: Endpoint, completion: @escaping (DecodeResults) -> Void)
    func fetchAvatar(userName: String, completion: @escaping (Data) -> Void)
}

class UserListInteractor: UserListInteractorType {

    let dataFecher: HttpDataFeching
    
    init(dataFecher: HttpDataFeching) {
        self.dataFecher = dataFecher
    }
    
    func fetchUsers(for endpoint: Endpoint, completion: @escaping (DecodeResults) -> Void) {
        dataFecher.fetchData(for: .users) { (data) in
            guard let data = data else {
                return
            }
                       
            let decoded = try? JSONDecoder().decode([Users].self, from: data)
            completion(DecodeResults(results: decoded!))
        }
    }

    func fetchAvatar(userName: String, completion: @escaping (Data) -> Void) {
        dataFecher.fetchAvatar(userName: userName) { (data) in
            guard let data = data else {
                return
            }
            completion(data)
        }
    }
    
    
}

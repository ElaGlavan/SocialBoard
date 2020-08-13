//
//  UserDetailsInteractor.swift
//  SocialBoard
//
//  Created by Mihaela Glavan on 10/08/2020.
//  Copyright © 2020 Mihaela Glavan. All rights reserved.
//

import Foundation

protocol UserDetailsInteractorType {
    func fetchUsers(for endpoint: Endpoint, completion: @escaping (UserDetailsResults) -> Void)
    func fetchPosts(for endpoint: Endpoint, completion: @escaping (Posts) -> Void)
    func fetchComments(for endpoint: Endpoint, completion: @escaping (Comments) -> Void)
}

class UserDetailsInteractor: UserDetailsInteractorType {
    let dataFecher: HttpDataFecher
    
    init(dataFecher: HttpDataFecher) {
        self.dataFecher = dataFecher
    }
    
    func fetchUsers(for endpoint: Endpoint, completion: @escaping (UserDetailsResults) -> Void) {
           dataFecher.fetchData(for: .users) { (data) in
               guard let data = data else {
                   return
               }
            let decoded = try? JSONDecoder().decode([UserDetails].self, from: data)
            completion(UserDetailsResults(results: decoded!))
           }
       }
    
    func fetchPosts(for endpoint: Endpoint, completion: @escaping (Posts) -> Void) {
         dataFecher.fetchData(for: .posts) { (data) in
             guard let data = data else {
                 return
             }
          let decoded = try? JSONDecoder().decode([Post].self, from: data)
          completion(Posts(posts: decoded!))
         }
     }
    
    func fetchComments(for endpoint: Endpoint, completion: @escaping (Comments) -> Void) {
         dataFecher.fetchData(for: .comments) { (data) in
             guard let data = data else {
                 return
             }
          let decoded = try? JSONDecoder().decode([Comment].self, from: data)
            completion(Comments(comments: decoded!))
         }
     }

}

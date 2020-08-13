//
//  HttpDataFecher.swift
//  SocialBoard
//
//  Created by Mihaela Glavan on 10/08/2020.
//  Copyright © 2020 Mihaela Glavan. All rights reserved.
//

import Foundation

enum Endpoint {
    case users
    case posts
    case comments

    
    var urlString: String {
        let host = "http://jsonplaceholder.typicode.com/"
        
        switch self {
        case .users: return host + "users"
        case .posts: return host + "posts"
        case .comments: return host + "comments"
        }
    }
}

protocol HttpDataFeching {
    func fetchData(for endpoint: Endpoint, completion: @escaping (Data?) -> Void)
    func fetchAvatar(userName: String, completion: @escaping (Data?) -> Void)
}

class HttpDataFecher: HttpDataFeching {
    func fetchData(for endpoint: Endpoint, completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: endpoint.urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            completion(data)
        }.resume()
    }
    
    func fetchAvatar(userName: String, completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: "https://api.adorable.io/avatars/285/\(userName)@adorable.png") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            completion(data)
        }.resume()
    }
}

    
 
    
    


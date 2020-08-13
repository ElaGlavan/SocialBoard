//
//  UserDetailsPresenter.swift
//  SocialBoard
//
//  Created by Mihaela Glavan on 10/08/2020.
//  Copyright © 2020 Mihaela Glavan. All rights reserved.
//

import Foundation

protocol UserDetailsPresenterType {
    func viewDidLoad()
}

class UserDetailsPresenter: UserDetailsPresenterType {
    var view: UserDetailsView
    let interactor: UserDetailsInteractorType
    let router: RouterType
    let indexPath: Int
    
    init(view: UserDetailsView, interactor: UserDetailsInteractorType, router: RouterType, indexPath: Int) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.indexPath = indexPath
        
    }
    
    func viewDidLoad() {
        interactor.fetchUsers(for: .users) { (users) in
            self.interactor.fetchPosts(for: .posts) { (user) in
                var userSelectedWithPostId = [Int: Int]()
                let userPosts = user.posts.filter { (post) -> Bool in
                    userSelectedWithPostId[post.id] = 1
                    return post.userId - 1 == self.indexPath
                }
                self.interactor.fetchComments(for: .comments) { (user) in
                    var idCommentWithNumberOfComments = [Int: Int]()
                    _ = user.comments.enumerated().map { (index, userComments) -> [Int: Int] in
                        if userSelectedWithPostId[userComments.postId] != nil {
                            if let hasValue = idCommentWithNumberOfComments[userComments.postId] {
                                idCommentWithNumberOfComments[userComments.postId] = hasValue + 1
                            } else {
                                idCommentWithNumberOfComments[userComments.postId] = 1
                            }
                        }
                        return idCommentWithNumberOfComments
                    }
                    let usersDetails = users.results.enumerated().map { (index, users) -> UserDetailsVM in
                        return UserDetailsVM(fullName: users.name, userName: users.username, email: users.email, street: users.address.street, suite: users.address.suite , city: users.address.city , zipCode: users.address.zipcode, phone: users.phone, website: users.website, company: users.company.name, lat: users.address.geo.lat, lng: users.address.geo.lng, posts: userPosts, comments: idCommentWithNumberOfComments)
                    }
                    self.view.viewModel = UserDetailsViewModel(users: usersDetails)
                }
             }
        }
    }
}

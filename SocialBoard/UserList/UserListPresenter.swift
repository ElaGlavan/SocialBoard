//
//  UserListPresenter.swift
//  SocialBoard
//
//  Created by Mihaela Glavan on 10/08/2020.
//  Copyright © 2020 Mihaela Glavan. All rights reserved.
//

import Foundation

protocol UserListPresenterType {
    func viewDidLoad()
     func didSelectCell(with indexPath: Int, userName: String)
}

class UserListPresenter: UserListPresenterType {
    var interactor: UserListInteractorType
    var view: UserListView
    var router: RouterType
    
    init(view: UserListView, interactor: UserListInteractorType, router: RouterType) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        interactor.fetchUsers(for: .users) { (users) in
            self.view.viewModel = UserListViewModel(userList: users.results)
        }
    }
    
    func didSelectCell(with indexPath: Int, userName: String) {
        router.navigateToUserDetails(indexPath: indexPath, userName: userName)
    }
}

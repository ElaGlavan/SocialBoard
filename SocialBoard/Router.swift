//
//  Router.swift
//  SocialBoard
//
//  Created by Mihaela Glavan on 10/08/2020.
//  Copyright © 2020 Mihaela Glavan. All rights reserved.
//

import Foundation
import UIKit

protocol RouterType {
    func navigateToUserList()
    func navigateToUserDetails(indexPath: Int, userName: String)
}

class Router: RouterType {
    var storyboard: UIStoryboard
    var userListNavigationController: UINavigationController
    let dataFecher = HttpDataFecher()

    init(storyboard: UIStoryboard, userListNavigationController: UINavigationController) {
        self.storyboard = storyboard
        self.userListNavigationController = userListNavigationController
    }

    func navigateToUserList() {
        let viewController = storyboard.instantiateViewController(withIdentifier: "UserListViewController") as! UserListViewController
        viewController.title = "Users"
        let interactor = UserListInteractor(dataFecher: dataFecher)
        let presenter = UserListPresenter(view: viewController, interactor: interactor, router: self)
        viewController.presenter = presenter
        userListNavigationController.setViewControllers([viewController], animated: false)
    }
    
    func navigateToUserDetails(indexPath: Int, userName: String) {
        let viewController = storyboard.instantiateViewController(identifier: "UserDetailsViewController") as! UserDetailsViewController
        let interactor = UserDetailsInteractor(dataFecher: dataFecher)
        let presenter = UserDetailsPresenter(view: viewController, interactor: interactor, router: self, indexPath: indexPath)
        viewController.presenter = presenter
        viewController.title = userName
        viewController.index = indexPath
        userListNavigationController.pushViewController(viewController, animated: true)
    }
    
}

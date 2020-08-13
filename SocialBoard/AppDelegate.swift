//
//  AppDelegate.swift
//  SocialBoard
//
//  Created by Mihaela Glavan on 10/08/2020.
//  Copyright © 2020 Mihaela Glavan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var router: Router!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let userListNavigationController = UINavigationController()
        let keyWindow = UIWindow(frame: UIScreen.main.bounds)
        keyWindow.rootViewController = userListNavigationController
        
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        router = Router(storyboard: storyboard, userListNavigationController: userListNavigationController)
        router.navigateToUserList()
        
        keyWindow.makeKeyAndVisible()
        window = keyWindow
        
        return true
    }


}


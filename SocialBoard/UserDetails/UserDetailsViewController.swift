//
//  UserDetailsViewController.swift
//  SocialBoard
//
//  Created by Mihaela Glavan on 10/08/2020.
//  Copyright © 2020 Mihaela Glavan. All rights reserved.
//

import Foundation
import UIKit
import MapKit

protocol UserDetailsView {
    var viewModel: UserDetailsViewModel! {get set}
}
class UserDetailsViewController: UIViewController, UserDetailsView {
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: UserDetailsViewModel! {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    var presenter: UserDetailsPresenter!
    var index: Int!
    
    override func viewDidLoad() {
           super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        presenter.viewDidLoad()
    }
   
}

enum Type: Int {
    case one = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
    case six = 6
    
    var caseType: LabelContent {
        switch self {
        case .one: return .user
        case .two: return .email
        case .three: return .address
        case .four: return .phone
        case .five: return .website
        case .six : return .company
        }
    }
}

extension UserDetailsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        guard viewModel != nil else {
            return 0
        }
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard viewModel != nil else {
            return 0
        }
        if section == 1 {
            return 6
        } else if section == 3 {
            return viewModel.users[index].posts.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "nameAndPhoto") as! UserNameAndPhotoCell
            cell.loadAvatar(userName: viewModel.users[index].userName)
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "details") as! UserDetailsCell
            let dictionary: [Int: LabelContent] = [0:.user, 1:.email, 2: .address, 3: .phone, 4: .website, 5: .company]
            cell.populateCell(viewModel: viewModel, labelType: dictionary[indexPath.row]!, indexPath: index)
            return cell
        } else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "map") as! UserMapCell
            cell.populateCell(with: viewModel, index: index)
             return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "userPostsAndCommentsCell") as! UserPostsAndCommentsCell
            cell.populatCell(with: viewModel, index: index, indexPath: indexPath)
            return cell
        }
    }
}

extension UserDetailsViewController: UITableViewDelegate {
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return CGFloat(125.0)
        } else if indexPath.section == 2 {
            return CGFloat(100.0)
        } else if indexPath.section == 3 {
            return CGFloat(130.0)
        } else {
            if indexPath.row == 2 {
                return CGFloat(50.0)
            } else {
                return CGFloat(45.0)
            }
        }
    }
}

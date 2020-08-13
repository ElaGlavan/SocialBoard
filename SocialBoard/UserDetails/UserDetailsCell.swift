//
//  UserDetailsCell.swift
//  SocialBoard
//
//  Created by Mihaela Glavan on 12/08/2020.
//  Copyright © 2020 Mihaela Glavan. All rights reserved.
//

import Foundation
import UIKit

enum LabelContent: Int {
    case user = 1
    case email = 2
    case address = 3
    case phone = 4
    case website = 5
    case company = 6
}

class UserDetailsCell: UITableViewCell {
    @IBOutlet weak var userDetails: UILabel!
    
    func populateCell(viewModel: UserDetailsViewModel, labelType: LabelContent, indexPath: Int) {
        
        switch labelType {
        case .user:
            userDetails.text = "Name:  \( viewModel.users[indexPath].fullName)"
        case .email:
            userDetails.text = "email:  \( viewModel.users[indexPath].email)"
        case .address:
            userDetails.text = "Address: \(viewModel.users[indexPath].suite), street \(viewModel.users[indexPath].street), city: \(viewModel.users[indexPath].city), postCode: \(viewModel.users[indexPath].zipCode) )"
            userDetails.numberOfLines = 2
        case .phone:
            userDetails.text = "Phone:  \(viewModel.users[indexPath].phone)"
        case .website:
            userDetails.text = "Website:  \(viewModel.users[indexPath].website)"
        case .company:
            userDetails.text = "Company name:  \(viewModel.users[indexPath].company)"
        }
        
    }
}

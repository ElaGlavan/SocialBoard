//
//  UserPostsAndCommentsCell.swift
//  SocialBoard
//
//  Created by Mihaela Glavan on 12/08/2020.
//  Copyright © 2020 Mihaela Glavan. All rights reserved.
//

import Foundation
import UIKit

class UserPostsAndCommentsCell: UITableViewCell {
    @IBOutlet weak var userPostTitle: UILabel!
    @IBOutlet weak var userComments: UILabel!
    @IBOutlet weak var userPostBody: UILabel!
    
    func populatCell(with viewModel: UserDetailsViewModel, index: Int, indexPath: IndexPath) {
        userPostTitle.text = viewModel.users[index].posts[indexPath.row].title
        userPostTitle.numberOfLines = 2
        userComments.text = "comments: \(viewModel.users[index].comments[indexPath.row + 1]!)"
        userPostBody.text = viewModel.users[index].posts[indexPath.row].body
        userPostBody.numberOfLines = 5
    }
}

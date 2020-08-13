//
//  UserNameAndPhotoCell.swift
//  SocialBoard
//
//  Created by Mihaela Glavan on 12/08/2020.
//  Copyright © 2020 Mihaela Glavan. All rights reserved.
//

import Foundation
import UIKit

class UserNameAndPhotoCell: UITableViewCell {
    @IBOutlet weak var avatar: UIImageView!
    var dataFetcher = HttpDataFecher()

    func loadAvatar(userName: String) {
        dataFetcher.fetchAvatar(userName: userName) { (data) in
            DispatchQueue.main.async {
                self.avatar.image = UIImage(data: data!)
                self.avatar.layer.cornerRadius = self.avatar.frame.height/2
            }
        }
    }
}

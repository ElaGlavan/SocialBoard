//
//  UserListCollectionViewCell.swift
//  SocialBoard
//
//  Created by Mihaela Glavan on 10/08/2020.
//  Copyright © 2020 Mihaela Glavan. All rights reserved.
//

import Foundation
import UIKit

class UserListCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var daraFetcher = HttpDataFecher()
    
    func updateCell(with viewModel: UserListViewModel, indexPath: IndexPath) {
        userName.text = viewModel.userList[indexPath.row].name
        spinner.startAnimating()
    }
    
    func loadAvatar(userName: String) {
        daraFetcher.fetchAvatar(userName: userName) { (data) in
            DispatchQueue.main.async {
                self.userPhoto.image = UIImage(data: data!)
                self.userPhoto.layer.cornerRadius = self.userPhoto.frame.height/2
                self.spinner.stopAnimating()
                self.spinner.isHidden = true
            }
        }
    }
    
    
}

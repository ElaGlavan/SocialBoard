//
//  UserListViewController.swift
//  SocialBoard
//
//  Created by Mihaela Glavan on 10/08/2020.
//  Copyright © 2020 Mihaela Glavan. All rights reserved.
//

import Foundation
import UIKit

protocol UserListView {
    var viewModel: UserListViewModel! {get set}
}

class UserListViewController: UIViewController, UserListView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: UserListViewModel! {
        didSet {
            updateCell(with: viewModel)
        }
    }
    var presenter: UserListPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "UserListCollectionViewCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "UserListCollectionViewCell")
          
        collectionView.dataSource = self
        collectionView.delegate = self
        presenter.viewDidLoad()
    }
    
    func updateCell(with viewModel: UserListViewModel) {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

extension UserListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let viewModel = viewModel else {
            return 0
        }
        return viewModel.userList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserListCollectionViewCell", for: indexPath) as! UserListCollectionViewCell
        cell.updateCell(with: viewModel, indexPath: indexPath)
        cell.loadAvatar(userName: viewModel.userList[indexPath.row].username)
        return cell
    }
}

extension UserListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 400 , height: 400)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(10.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(10.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didSelectCell(with: indexPath.row, userName: viewModel.userList[indexPath.row].username)
    }
}

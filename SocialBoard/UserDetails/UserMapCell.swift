//
//  UserMapCell.swift
//  SocialBoard
//
//  Created by Mihaela Glavan on 12/08/2020.
//  Copyright © 2020 Mihaela Glavan. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class UserMapCell: UITableViewCell {
    @IBOutlet weak var map: MKMapView!
    
    func populateCell(with viewModel: UserDetailsViewModel, index: Int) {
        guard let lat = Float(viewModel.users[index].lat), let lgn = Float(viewModel.users[index].lng), let latDegree = CLLocationDegrees(exactly: lat), let lgnDegree = CLLocationDegrees(exactly: lgn) else {
            return
        }
        let location = CLLocationCoordinate2DMake(latDegree, lgnDegree)
        let region = MKCoordinateRegion(center: location, latitudinalMeters: 100000, longitudinalMeters: 100000)
        self.map.setRegion(region, animated: false)
    }
}

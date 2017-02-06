//
//  GMSMarker+Utility.swift
//  FindCar
//
//  Created by Nguyen Duc Hoang on 1/15/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import Foundation
import GoogleMaps
import UIKit

extension GMSMapView {
    func focusMapToCoordinates(locations: [CLLocationCoordinate2D]) {
        let path:GMSMutablePath = GMSMutablePath()
        for location:CLLocationCoordinate2D in locations {
            path.add(location)
        }
        let bounds = GMSCoordinateBounds(path: path)
        self.animate(with: GMSCameraUpdate.fit(bounds, withPadding: 5.0))
    }
}

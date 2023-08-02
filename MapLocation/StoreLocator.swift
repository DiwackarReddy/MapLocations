//
//  StoreLocator.swift
//  MapLocation
//
//  Created by Diwakar Reddy  on 01/05/23.
//

import Foundation
import MapKit

struct StoreLocator: Identifiable, Codable {
    let id: Int
    let name: String
    let address: String
    let phone: String
    let latitude: Double
    let longitude: Double
    
    // ComputedProperty
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}


extension CLLocationCoordinate2D {
    var appUrl: URL? {
        URL(
            string: Constants.GoogleMapsUrl.appUrl(
                latitude: latitude,
                longitude: longitude
            ).urlPath
        )
    }

    var webUrl: URL? {
        URL(
            string: Constants.GoogleMapsUrl.webUrl(
                latitude: latitude,
                longitude: longitude
            ).urlPath
        )
    }
}


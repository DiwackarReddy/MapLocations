//
//  Constants.swift
//  MapLocation
//
//  Created by Diwakar Reddy  on 01/05/23.
//

import SwiftUI
import CoreLocation
import MapKit

class Constants {
    enum GoogleMapsUrl {
        case appUrl(latitude: Double, longitude: Double)
        case webUrl(latitude: Double, longitude: Double)

        var urlPath: String {
            switch self {
            case .appUrl(let latitude, let longitude):
                return "comgooglemaps-x-callback://?saddr=&daddr=\(latitude),\(longitude)&directionsmode=driving"
            case .webUrl(let latitude, let longitude):
                return "https://www.google.com/maps/dir/?saddr=&daddr=\(latitude),\(longitude)&directionsmode=driving"
            }
        }
    }
}

final class OSInteractionService {
    static let shared = OSInteractionService()

    private init() {
    }

    func handlePhoneNumberAction(phoneNumber: String) {
        guard
            !phoneNumber.isEmpty,
            let url = URL(string: "tel://\(phoneNumber)"),
            UIApplication.shared.canOpenURL(url)
        else {
            return
        }
        UIApplication.shared.open(url)
    }

    func openAppSettings() {
        guard
            let settingsUrl = URL(string: UIApplication.openSettingsURLString),
            UIApplication.shared.canOpenURL(settingsUrl)
        else {
            return
        }
        UIApplication.shared.open(settingsUrl)
    }

    func openGoogleMaps(coordinate: CLLocationCoordinate2D) {
        guard
            let url = coordinate.appUrl ?? coordinate.webUrl,
            UIApplication.shared.canOpenURL(url)
        else {
            return
        }
        UIApplication.shared.open(url)
    }

    func openAppleMaps(coordinate: CLLocationCoordinate2D) {
        MKMapItem
            .openMaps(
                with: [
                    MKMapItem(
                        placemark: MKPlacemark(coordinate: coordinate)
                    ),
                ],
                launchOptions: [
                    MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving,
                ]
            )
    }
}

//
//  LocationCardView.swift
//  MapLocation
//
//  Created by Diwakar Reddy  on 01/05/23.
//

import SwiftUI
import CoreLocation

struct LocationCardView: View {
    // MARK: - Property
    var location: StoreLocator
    // MARK: - Body
    var body: some View {
        ZStack {
            Color.white
            VStack(alignment: .leading,spacing: 15) {
                HStack(spacing: 10) {
                    ZStack {
                        Circle()
                            .fill(Color.red)
                            .frame(width: 35,height: 35,alignment: .center)
                        
                        Text("\(location.id)")
                            .frame(width: 35,height: 35,alignment: .center)
                        .clipShape(Circle())
                        .clipShape(Circle())
                    } // :- ZStack
                    VStack(alignment: .leading) {
                        Text("\(location.name)")
                            .font(.headline)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                        Text("0.12 Miles Away")
                            .font(.footnote)
                            .fontWeight(.light)
                            .foregroundColor(.gray)
                    }
                } // :- HStack
                HStack {
                    Image(systemName: "building")
                        .foregroundColor(.blue)
                    .imageScale(.large)
                    
                    Text("\(location.name)")
                        .font(.footnote)
                        .fontWeight(.light)
                        .foregroundColor(.gray)
                } // :- HStack
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                        .foregroundColor(.blue)
                    .imageScale(.large)
                    
                    Text("\(location.address)")
                        .font(.footnote)
                        .fontWeight(.light)
                        .foregroundColor(.gray)
                } // :- HStack
                HStack {
                    Image(systemName: "phone.fill")
                        .foregroundColor(.blue)
                    .imageScale(.large)
                    
                    Text("\(location.phone)")
                        .font(.footnote)
                        .fontWeight(.light)
                        .foregroundColor(.gray)
                } // :- HStack
                HStack(spacing: 0) {
                    ZStack {
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: 120,height: 54,alignment: .center)
                            .cornerRadius(10)
                        Button(action: {OSInteractionService.shared.openAppleMaps(coordinate: location.location)}) {
                            Text("Directions")
                                .font(.headline)
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                        }
                    } // :- ZStack
                    Spacer()
                    ZStack {
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: 120,height: 54,alignment: .center)
                            .cornerRadius(10)
                        Button(action: {
                            OSInteractionService.shared.handlePhoneNumberAction(phoneNumber: location.phone)
                            
                        }) {
                            Text("Call")
                                .font(.headline)
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                        }
                    } // :- ZStack
                } // :- HStack
            }// :- Vstack
            .padding()
        }// :- ZStack
        .cornerRadius(20)
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
}

struct LocationCardView_Previews: PreviewProvider {
    static var previews: some View {
        LocationCardView(location: storeLocater[0])
    }
}

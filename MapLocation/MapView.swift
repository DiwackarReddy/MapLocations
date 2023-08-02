//
//  MapView.swift
//  MapLocation
//
//  Created by Diwakar Reddy  on 01/05/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    // MARK: - Property
    @State private var region: MKCoordinateRegion = {
        var mapCpprdinates = CLLocationCoordinate2D(latitude: 17.4392, longitude: 78.3754)
        var mapzoomLevel = MKCoordinateSpan(latitudeDelta: 0.050, longitudeDelta: 0.030)
        var mapRegion = MKCoordinateRegion(center: mapCpprdinates, span: mapzoomLevel)
        return mapRegion
    }()
    let locations: [StoreLocator] = storeLocater
    @StateObject var vm = LocationViewModel()
    // MARK: - Body
    var body: some View {
        Map(coordinateRegion: $region,annotationItems: locations) { items in
            MapAnnotation(coordinate: items.location) {
                MapPinView(location: items)
                    .id(items.id)
                    .onTapGesture {
                        vm.selctedStore = items.id
                    }
            }
        }// :- MAP
        .overlay(
            ScrollViewReader { proxy in
                ScrollView(.horizontal,showsIndicators: false) {
                    LazyHStack {
                        ForEach(locations) { item in
                            LocationCardView(location: item)
                                .frame(width: 300,height: 250)
                                .shadow(color: Color(.gray), radius: 3, x: -1, y: 1)
                                .padding()

                        }// :- Loop
                    }// :- HStack
                    .frame(height: 300)
                }
                .onReceive(vm.$selctedStore) { index in
                    withAnimation {
                        proxy.scrollTo(index, anchor: .center)
                    }
                }
                
            } // :- ScrollViewReader
            ,alignment: .bottom
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

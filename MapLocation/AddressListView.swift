//
//  AddressListView.swift
//  MapLocation
//
//  Created by Diwakar Reddy  on 01/05/23.
//

import SwiftUI

struct AddressListView: View {
    // MARK: - Property
    let locations: [StoreLocator] = storeLocater
    // MARK: - Body
    var body: some View {
        ScrollView(.vertical,showsIndicators: false) {
                VStack {
                    ForEach(locations) { item in
                    LocationCardView(location: item)
                    .padding()
                    .shadow(color: Color(.gray), radius: 3, x: -1, y: 1)
                }// :- Loop
            }// :- HStack
        }
    }
}

struct AddressListView_Previews: PreviewProvider {
    static var previews: some View {
        AddressListView()
    }
}

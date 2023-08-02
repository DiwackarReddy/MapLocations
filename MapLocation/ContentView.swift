//
//  ContentView.swift
//  MapLocation
//
//  Created by Diwakar Reddy  on 01/05/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Property
    @State var selected: Bool = false
    // MARK: - Body
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Nearest Stores")
                        .font(.headline)
                        .foregroundColor(.black)
                    Spacer()
                    Button(action: {
                        self.selected = false
                    }) {
                        Image(systemName: "map")
                            .foregroundColor(!selected ? .blue : .gray)
                            .imageScale(.large)
                        Text("Map")
                            .font(.footnote)
                            .foregroundColor(!selected ? .blue : .gray)
                    }

                    Button(action: {
                        self.selected = true
                    }) {
                        Image(systemName: "list.bullet.rectangle")
                            .foregroundColor(selected ? .blue : .gray)
                            .imageScale(.large)
                        Text("List")
                            .font(.footnote)
                            .foregroundColor(selected ? .blue : .gray)
                    }
                }// :- HStack
                .padding()
                if selected {
                    AddressListView()
                } else {
                    MapView()
                }
               
            } // :- VStack
            .navigationTitle("Store Locator")
                .navigationBarTitleDisplayMode(.inline)
        } // :- NavigationView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

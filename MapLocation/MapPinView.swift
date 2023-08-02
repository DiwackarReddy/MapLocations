//
//  MapPinView.swift
//  MapLocation
//
//  Created by Diwakar Reddy  on 01/05/23.
//

import SwiftUI

struct MapPinView: View {
    // MARK: - Property
    var location: StoreLocator
    @State private var animation: Double = 0.0
    // MARK: - Body
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.red)
                .frame(width: 48,height: 48,alignment: .center)
            
            Circle()
                .stroke(Color.red,lineWidth: 2)
                .frame(width: 46,height: 46,alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
            
            Text("\(location.id)")
                .frame(width: 44,height: 44,alignment: .center)
            .clipShape(Circle())
            .clipShape(Circle())
        } // :- ZStack
        .onAppear {
            withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)){
                animation = 1
            }
        }
    }
}

struct MapPinView_Previews: PreviewProvider {
    static var previews: some View {
        MapPinView(location: storeLocater[0])
    }
}

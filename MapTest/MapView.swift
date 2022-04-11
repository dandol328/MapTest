//
//  MapView.swift
//  MapTest
//
//  Created by Dan on 4/10/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        
//        Map(coordinateRegion: $locationManager.region, interactionModes: .all, showsUserLocation: true) {
//            MapMarker(coordinate: $0.coordinate)
//        }
//            .ignoresSafeArea()
//            .accentColor(Color(.systemRed))
//            .onAppear {
//                locationManager.checkIfLocationServicesIsEnabled()
//            }
        Text("Latitude: \(locationManager.fixedRegion.center.latitude)")
        Text("Longitude: \(locationManager.fixedRegion.center.longitude)")
        Text(locationManager.latString)
        Text(locationManager.longString)

    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

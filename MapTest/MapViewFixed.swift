//
//  MapView.swift
//  MapTest
//
//  Created by Dan on 4/12/22.
//

import SwiftUI
import MapKit
import Combine

class MapViewFixedLocationInput: ObservableObject {
    @Published var latitude = "1.0"
    @Published var longitude = "2.0"
}


struct MapViewFixed: View {
    
    @EnvironmentObject var mapViewFixedLocationInput: MapViewFixedLocationInput
    
    var body: some View {
        
        Text("Latitude: \(mapViewFixedLocationInput.latitude)")

//        Map(coordinateRegion: $locationManager.region, interactionModes: .all, showsUserLocation: true, annotationItems: annotations) {
//            MapMarker(coordinate: $0.coordinate)
//        }
//            .ignoresSafeArea()
//            .accentColor(Color(.systemMint))
//            .onAppear {
//                locationManager.checkIfLocationServicesIsEnabled()
//            }

    }

}

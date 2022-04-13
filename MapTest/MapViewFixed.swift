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
    @Published var latitude = 1.0
    @Published var longitude = 1.0
    @Published var fixedRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 1.0, longitude: 1.0), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
}

struct MapViewFixed: View {
    
    @EnvironmentObject var mapViewFixedLocationInput: MapViewFixedLocationInput
        
    var body: some View {
        
        Text("Latitude: \(mapViewFixedLocationInput.latitude)")

        Map(coordinateRegion: $mapViewFixedLocationInput.fixedRegion, interactionModes: .all, showsUserLocation: false)
            .ignoresSafeArea()
            .accentColor(Color(.systemMint))
            .onAppear {
                mapViewFixedLocationInput.fixedRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: mapViewFixedLocationInput.latitude, longitude: mapViewFixedLocationInput.longitude), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            }

    }

}

//
//  MapView.swift
//  MapTest
//
//  Created by Dan on 4/12/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @ObservedObject var locationManager = LocationManager()
    
    let annotations = [
        City(name: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275)),
        City(name: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508)),
        City(name: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5)),
        City(name: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667)),
        City(name: "Bispo", coordinate: CLLocationCoordinate2D(latitude: 35.23825, longitude: -120.63791))
    ]

    
    var body: some View {
        
        Map(coordinateRegion: $locationManager.region, interactionModes: .all, showsUserLocation: true, annotationItems: annotations) {
            MapMarker(coordinate: $0.coordinate)
        }
            .ignoresSafeArea()
            .accentColor(Color(.systemMint))
            .onAppear {
                locationManager.checkIfLocationServicesIsEnabled()
            }

    }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

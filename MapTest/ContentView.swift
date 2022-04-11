//
//  ContentView.swift
//  MapTest
//
//  Created by Dan on 4/9/22.
//

import SwiftUI
import MapKit

struct City: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var mapView = MapView()
    let annotations = [
        City(name: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275)),
        City(name: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508)),
        City(name: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5)),
        City(name: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667)),
        City(name: "Bispo", coordinate: CLLocationCoordinate2D(latitude: 35.23825, longitude: -120.63791))
    ]

    
    var body: some View {
        mapView.body
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(locationManager: LocationManager())
    }
}

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
    @ObservedObject var locationManager = LocationManager()
    @State var mapView = MapView()
    @StateObject var mapViewFixedLocationInput = MapViewFixedLocationInput()

    var body: some View {
        VStack {
            MapViewFixed()
        }
        .environmentObject(mapViewFixedLocationInput)
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                mapViewFixedLocationInput.latitude = 33.54311
                mapViewFixedLocationInput.longitude = -112.23399
                mapViewFixedLocationInput.fixedRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: mapViewFixedLocationInput.latitude, longitude: mapViewFixedLocationInput.longitude), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(locationManager: LocationManager())
    }
}

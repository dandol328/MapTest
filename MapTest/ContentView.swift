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
        mapView.body
            .onAppear() {
                locationManager.checkIfLocationServicesIsEnabled()
            }
        NavigationView {
            VStack {
                // A button that writes to the environment settings
                Button("Change Latitude") {
                    mapViewFixedLocationInput.latitude = 33.543
                }
                Button("Change Longitude") {
                    mapViewFixedLocationInput.longitude = -112.233
                }

                Text("Latitude: \(mapViewFixedLocationInput.latitude)")
                
                Text("Longitude: \(mapViewFixedLocationInput.longitude)")

                NavigationLink(destination: MapViewFixed()) {
                    Text("Show Detail View")
                }
                
                Text(locationManager.latString)
                Text(locationManager.longString)
                    .onAppear() {
                        locationManager.checkIfLocationServicesIsEnabled()
                    }

            }
        }
        .environmentObject(mapViewFixedLocationInput)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(locationManager: LocationManager())
    }
}

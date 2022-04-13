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
    
    var body: some View {
        mapView.body
            .onAppear() {
                locationManager.checkIfLocationServicesIsEnabled()
            }
//        Text(locationManager.latString)
//        Text(locationManager.longString)
//            .onAppear() {
//                locationManager.checkIfLocationServicesIsEnabled()
//            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(locationManager: LocationManager())
    }
}

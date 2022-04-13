//
//  ContentView.swift
//  MapTest
//
//  Created by Dan on 4/9/22.
//

import SwiftUI
import MapKit

struct ContentView: View {
   
    @ObservedObject var locationManager = LocationManager()
   
    @State private var mapView = MapView()
    
    var body: some View {
        mapView.body
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(locationManager: LocationManager())
    }
}

//
//  LocationManager.swift
//  MapTest
//
//  Created by Dan on 4/9/22.
//

import Foundation
import CoreLocation
import MapKit

// https://stackoverflow.com/questions/57681885/how-to-get-current-location-using-swiftui-without-viewcontrollers?rq=1

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {

    var locationManager: CLLocationManager?
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 1.0, longitude: 1.0), span: MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0))

    @Published var fixedRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 1.0, longitude: 1.0), span: MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0))
    
    @Published var latString = "No lat yet..."
    @Published var longString = "No long yet..."

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            latString = "\(location.coordinate.latitude)"
            longString = "\(location.coordinate.longitude)"
        }

    }
    
    func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager?.desiredAccuracy = kCLLocationAccuracyBestForNavigation
            locationManager!.delegate = self
            locationManager?.startUpdatingLocation()
            print("Starting to update location services")
        } else {
            print("Fail something")
        }
    }
    
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else {
            return
        }
        
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Restriction mode enabled")
        case .denied:
            print("User is a moron")
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            fixedRegion = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))

        @unknown default:
            break
        }
        
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
}

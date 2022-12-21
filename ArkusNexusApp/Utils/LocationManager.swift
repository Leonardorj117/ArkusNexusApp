//
//  LocationManager.swift
//  ArkusNexusApp
//
//  Created by Leonardo Rubio on 21/12/22.
//

import Foundation
import CoreLocation

class LocationManager:NSObject{
    private let LocationManager:CLLocationManager = .init()

    override init (){
        super.init()
        self.LocationManager.delegate = self
        self.LocationManager.requestWhenInUseAuthorization()
        self.LocationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
}
//MARK: - CLLocationManagerDelegate
extension LocationManager:CLLocationManagerDelegate{
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        switch manager.authorizationStatus{
        case .authorizedWhenInUse:
            self.LocationManager.startUpdatingLocation()
        case .notDetermined:
            print("Authorization indermined.")
            break
        case .restricted:
            print("Authorization resctricted.")
            break
        case .denied:
            self.LocationManager.stopUpdatingLocation()
            break
        case .authorizedAlways:
            self.LocationManager.startUpdatingLocation()
         default:
            break
        }
    }
}

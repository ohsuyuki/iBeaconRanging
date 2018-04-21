//
//  ViewController.swift
//  iBeaconRanging
//
//  Created by osu on 2018/04/21.
//  Copyright © 2018 osu. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    var locationManager: CLLocationManager!
    var isRanging: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager = CLLocationManager()
        locationManager.delegate = self

        let status = CLLocationManager.authorizationStatus()
        if (status != CLAuthorizationStatus.authorizedAlways) {
            locationManager.requestAlwaysAuthorization()
        }
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch (status) {
        case .authorizedAlways:
            iBeaconRanging()
            break
        default:
            break
        }
    }

    func iBeaconRanging() {
        guard isRanging == false else {
            return
        }

        let beaconRegion = CLBeaconRegion(proximityUUID: UUID(uuidString: "48534442-4C45-4144-80C0-1800FFFFFFFF")!, identifier: "6XFdNd")
        locationManager.startRangingBeacons(in: beaconRegion)

        isRanging = true
    }

    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        for beacon in beacons {
            print(beacon)
        }
    }

}

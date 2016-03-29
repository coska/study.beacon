//
//  ViewController.swift
//  SwiftExample
//
//  Copyright © 2015 Mobstac Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, BeaconstacDelegate
{
	let DEV_TOKEN = "3c1875eecdf18ecb676f86269dfc5bbfb862859e"
	let ORG_ID = 1075
	let BEACON_UUID = "F94DBB23-2266-7822-3782-57BEAC0952AC"
	

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let beacon = Beaconstac.sharedInstanceWithOrganizationId(ORG_ID, developerToken: DEV_TOKEN)
        MSLogger.sharedInstance().loglevel = MSLogLevel.Verbose
        
        beacon.delegate = self
        beacon.startRangingBeaconsWithUUIDString(BEACON_UUID, beaconIdentifier: "MobstacRegion", filterOptions: nil)
    }

    func beaconstac(beaconstac: Beaconstac!, rangedBeacons beaconsDictionary: [NSObject : AnyObject]!)
    {
        print("Beacons ranged" + beaconsDictionary.description, terminator: "")
    }
    
    func beaconstac(beaconstac: Beaconstac!, campedOnBeacon beacon: MSBeacon!, amongstAvailableBeacons beaconsDictionary: [NSObject : AnyObject]!)
    {
        print("Camped On Beacon" + beacon.beaconKey, terminator: "")
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}


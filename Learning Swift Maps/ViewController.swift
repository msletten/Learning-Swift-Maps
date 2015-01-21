//
//  ViewController.swift
//  Learning Swift Maps
//
//  Created by Mat Sletten on 11/14/14.
//  Copyright (c) 2014 Mat Sletten. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
                            
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Devil's Tower coords: 44.590412, -104.714606
        var latitudeDT:CLLocationDegrees = 44.590412
        var longitudeDT:CLLocationDegrees = -104.714606
        //The bigger the xDelta(zoom level) is the more zoomed out the map will be. Essentially, we're setting a variable to be the value of the difference in the degrees from the left side of the screen to the right side of the screen
        var latDelta:CLLocationDegrees = 0.01
        var longDelta:CLLocationDegrees = 0.01
        //This makes a geo span using set up values to be applied to the MKRegion we make. This in conjunction with the location we make will constitute the region.
        var mapSpan:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        var mapLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitudeDT, longitudeDT)
        var mapRegion:MKCoordinateRegion = MKCoordinateRegionMake(mapLocation, mapSpan)
        
        mapView.setRegion(mapRegion, animated: true)
       
        //This is how to add annotation
        var placeAnnotation = MKPointAnnotation()
        placeAnnotation.coordinate = mapLocation
        placeAnnotation.title = "Place of Eating"
        placeAnnotation.subtitle = "Get full on abundance..."
        mapView.addAnnotation(placeAnnotation)
        
        //This allows users to press and add anotations. The action function is called and needs a colon because the function has parameters. If no parameters are used, then no colon is needed.
        var userAnnotation = UILongPressGestureRecognizer(target: self, action: "action:")
        userAnnotation.minimumPressDuration = 2.0
        mapView.addGestureRecognizer(userAnnotation)
        
    }
    
    func action(pressRecognizer:UIGestureRecognizer) {
        var touchPoint = pressRecognizer.locationInView(self.mapView)
        var touchCoordinate:CLLocationCoordinate2D = mapView.convertPoint(touchPoint, toCoordinateFromView: self.mapView)
        var touchAnnotation = MKPointAnnotation()
        touchAnnotation.coordinate = touchCoordinate
        touchAnnotation.title = "New Place"
        touchAnnotation.subtitle = "Look, I touched my self"
        mapView.addAnnotation(touchAnnotation)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


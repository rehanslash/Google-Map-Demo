//
//  ViewController.swift
//  GoogleMapProject
//
//  Created by HigherVisibility on 14/01/2018.
//  Copyright © 2018 ahmedHigherVisibility. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {

    
    
    @IBOutlet weak var GooglMaps: GMSMapView!
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let camera = GMSCameraPosition.camera(withLatitude: 37.36, longitude: -122.0, zoom: 12.0)
        GooglMaps.camera = camera
        
        let drv1 = CLLocationCoordinate2DMake(37.45,-122.0)
        let drv2 = CLLocationCoordinate2DMake(37.45,  -122.2 )
        let drv3 = CLLocationCoordinate2DMake(37.36, -122.2)
        
         self.showdrv1(position: drv1)
        self.showdrv2(position: drv2)
        self.showdrv3(position: drv3)
        showMarker(position: camera.target)
        GooglMaps.settings.myLocationButton = true
        // Do any additional setup after loading the view, typically from a nib.
        self.drawRectange()
    }

    func addTimer() {
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true, block: { (timer) in
            print("Runing timer")
        })
    }
    
    
    func stopTimer()  {
    

    }
    
    func drawRectange(){
        
        /* create the path */
//        let rect = GMSMutablePath()
//        rect.add(CLLocationCoordinate2D(latitude: 37.36, longitude: -122.0))
//        rect.add(CLLocationCoordinate2D(latitude: 37.45, longitude: -122.0))
//        rect.add(CLLocationCoordinate2D(latitude: 37.45, longitude: -122.2))
//        rect.add(CLLocationCoordinate2D(latitude: 37.36, longitude: -122.2))
//
//        // Create the polygon, and assign it to the map.
//        let polygon = GMSPolygon(path: rect)
//        polygon.fillColor = UIColor(red: 0.25, green: 0, blue: 0, alpha: 0.2);
//        polygon.strokeColor = .black
//        polygon.strokeWidth = 2
//        polygon.map = GooglMaps
//        let circleCenter = CLLocationCoordinate2D(latitude: 37.35, longitude: -122.0)
//        let circ = GMSCircle(position: circleCenter, radius: 1000)
//        circ.strokeColor = UIColor.purple
//        circ.strokeWidth = 1
//        circ.fillColor = UIColor(red: 0.25, green: 0, blue: 0, alpha: 0.2);
//        circ.map = GooglMaps
        
    }
    
    func showMarker(position: CLLocationCoordinate2D){
        let marker = GMSMarker()
        marker.icon = UIImage(named: "icons8-car-50")
        marker.position = position
        marker.title = "Drv 1"
        marker.snippet = "San Francisco"
        marker.map = GooglMaps
    }
    
    func showdrv1(position: CLLocationCoordinate2D){
        let marker = GMSMarker()
        marker.icon = UIImage(named: "icons8-car-50")
        marker.position = position
        marker.title = "Drv 2"
        marker.snippet = "San Francisco"
        marker.map = GooglMaps
    }
    func showdrv2(position: CLLocationCoordinate2D){
        let marker = GMSMarker()
        marker.icon = UIImage(named: "icons8-car-50")
        marker.position = position
        marker.title = "Drv 3"
        marker.snippet = "San Francisco"
        marker.map = GooglMaps
    }
    func showdrv3(position: CLLocationCoordinate2D){
        let marker = GMSMarker()
        marker.icon = UIImage(named: "icons8-car-50")
        marker.position = position
        marker.title = "DRv 4"
        marker.snippet = "San Francisco"
        marker.map = GooglMaps
    }
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        print("didTapInfoWindowOf")
    }
    
    /* handles Info Window long press */
    func mapView(_ mapView: GMSMapView, didLongPressInfoWindowOf marker: GMSMarker) {
        print("didLongPressInfoWindowOf")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
extension ViewController: GMSMapViewDelegate{
    
    //set a custom Info Window
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        
        let view = UIView(frame: CGRect.init(x: 0, y: 0, width: 600, height: 170))
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 6
        
        let lbl1 = UILabel(frame: CGRect.init(x: 8, y: 8, width: view.frame.size.width - 16, height: 15))
        lbl1.text = "Hi there!"
        view.addSubview(lbl1)
        
        let lbl2 = UILabel(frame: CGRect.init(x: lbl1.frame.origin.x, y: lbl1.frame.origin.y + lbl1.frame.size.height + 3, width: view.frame.size.width - 16, height: 15))
        lbl2.text = "I am a custom info window."
        lbl2.font = UIFont.systemFont(ofSize: 14, weight: .light)
        view.addSubview(lbl2)
        
        return view
    }
    
    
}

//
//  ViewController.swift
//  naverMap
//
//  Created by 김승현 on 2022/07/12.
//

import UIKit
import NMapsMap
import CoreLocation


class MapViewController: UIViewController, NMFMapViewCameraDelegate, CLLocationManagerDelegate {
    
    var manager = CLLocationManager()
    var currentLocation: CLLocation!
    
    @IBOutlet weak var mapView: NMFMapView!
    
    let goToCurrentButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .clear
        btn.setBackgroundImage(UIImage(named: "currentLocation")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = .green
        btn.addTarget(self, action: #selector(btntapped(_:)), for: .touchUpInside)
        return btn
    }()
    
    let CurrentCoord = NMGLatLng(lat: 37.5670135, lng: 126.9783740)
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //mapView.allowsZooming = true
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            manager.startUpdatingLocation()
            let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: CurrentCoord.lat , lng: CurrentCoord.lng ))
            cameraUpdate.animation = .easeIn
            mapView.moveCamera(cameraUpdate)
            
            let marker = NMFMarker()
            //marker.iconImage = NMF_MARKER_IMAGE_PINK
            marker.iconImage = NMFOverlayImage(name: "currentLocation")
            marker.position = NMGLatLng(lat: CurrentCoord.lat, lng: CurrentCoord.lng)
            marker.mapView = mapView
        } else { }
        

        
        
        currentLocation = manager.location
        
        view.addSubview(goToCurrentButton)
        goToCurrentButtonAuto()
        
        
        
    }

//    func mapView(_ mapView: NMFMapView, cameraIsChangingByReason reason: Int) {
//        print("카메라가 변경됨: reason: \(reason)")
//        let cameraPosition = mapView.cameraPosition
//        print(cameraPosition.target.lat, cameraPosition.target.lng)
//    }

    @objc func btntapped(_ sender: UIButton) {
        mapView.moveCamera(NMFCameraUpdate(scrollTo: NMGLatLng(lat: CurrentCoord.lat, lng: CurrentCoord.lng)), completion: nil)
        
    }
    
    func goToCurrentButtonAuto() {
        goToCurrentButton.translatesAutoresizingMaskIntoConstraints = false
        goToCurrentButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        goToCurrentButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        goToCurrentButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        goToCurrentButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150).isActive = true
    }
    
}


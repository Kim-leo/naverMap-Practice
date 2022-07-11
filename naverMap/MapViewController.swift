//
//  ViewController.swift
//  naverMap
//
//  Created by 김승현 on 2022/07/12.
//

import UIKit
import NMapsMap



class MapViewController: UIViewController, NMFMapViewCameraDelegate {
    
    @IBOutlet weak var mapView: NMFMapView!
    
    let CurrentCoord = NMGLatLng(lat: 37.5670135, lng: 126.9783740)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.allowsZooming = true
        
        
        
        
        
        
    }


}


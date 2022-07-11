//
//  ViewController.swift
//  naverMap
//
//  Created by 김승현 on 2022/07/12.
//

import UIKit
import NMapsMap

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mapView = NMFMapView(frame: view.frame)
        view.addSubview(mapView)
    }


}


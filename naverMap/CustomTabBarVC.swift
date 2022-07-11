//
//  CustomTabBarVC.swift
//  naverMap
//
//  Created by 김승현 on 2022/07/12.
//

import Foundation
import UIKit

class CustomTabBarVC: UITabBarController, UITabBarControllerDelegate {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.selectedIndex = 1
        setupMiddleButton()
        
    }
    
    func setupMiddleButton() {
        let pinkColor = UIColor(rgb: 0xF27A98)
        
        let middleButton = UIButton()
        
        middleButton.backgroundColor = pinkColor
        middleButton.layer.shadowColor = UIColor.black.cgColor
        middleButton.layer.shadowOpacity = 0.1
        middleButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        middleButton.layer.cornerRadius = 5
        
        self.tabBar.addSubview(middleButton)
        
        middleButton.translatesAutoresizingMaskIntoConstraints = false
        middleButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        middleButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        middleButton.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor).isActive = true
        middleButton.centerYAnchor.constraint(equalTo: tabBar.topAnchor, constant: 20).isActive = true
        
        middleButton.addTarget(self, action: #selector(menuButtonAction), for: .touchUpInside)
        
        self.view.layoutIfNeeded()
    }
    
    @objc func menuButtonAction(sender: UIButton) {
        self.selectedIndex = 1
    }
    
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, a: Int = 0xFF) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: CGFloat(a) / 255.0
        )
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    convenience init(argb: Int) {
        self.init(
            red: (argb >> 16) & 0xFF,
            green: (argb >> 8) & 0xFF,
            blue: argb & 0xFF,
            a: (argb >> 24) & 0xFF)
    }
}

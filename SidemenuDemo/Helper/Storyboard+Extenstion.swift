//
//  Storyboard+Extenstion.swift
//  SidemenuDemo
//
//  Created by Ravi kumar Yaganti on 20/07/20.
//  Copyright © 2020 Ravi kumar Yaganti. All rights reserved.
//

import UIKit

extension UIStoryboard {
    // Get Storyboard
    static func mainStoryboard() -> UIStoryboard { return UIStoryboard(name: "Main", bundle: Bundle.main) }
    
    // Get Container view
    static func getContainerView() -> UINavigationController{
        let containerVC = self.mainStoryboard().instantiateViewController(withIdentifier: "ContainerViewController") as? ContainerViewController
        
        return UINavigationController(rootViewController: containerVC!)
    }
}

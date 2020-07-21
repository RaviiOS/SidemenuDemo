//
//  Helper.swift
//  SidemenuDemo
//
//  Created by Ravi kumar Yaganti on 20/07/20.
//  Copyright © 2020 Ravi kumar Yaganti. All rights reserved.
//

import UIKit

struct Helper {
    
    static func logout() {
        let vc = LoginVC()
        vc.view.backgroundColor = .white
        guard let window = UIApplication.shared.windows.first else { return }
        window.rootViewController = UINavigationController(rootViewController: vc)
        window.makeKeyAndVisible()
        let options: UIView.AnimationOptions = .transitionCrossDissolve
//
//        // The duration of the transition animation, measured in seconds.
        let duration: TimeInterval = 0.3
//
//        // Creates a transition animation.
//        // Though `animations` is optional, the documentation tells us that it must not be nil. ¯\_(ツ)_/¯
        UIView.transition(with: window, duration: duration, options: options, animations: {}, completion:
        { completed in
            // maybe do something on completion here
        })

    }
}

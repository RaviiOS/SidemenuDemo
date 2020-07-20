//
//  LoginVC.swift
//  SidemenuDemo
//
//  Created by Ravi kumar Yaganti on 20/07/20.
//  Copyright © 2020 Ravi kumar Yaganti. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    lazy var loginButton: UIButton =  {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .purple
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(tapOnLogin), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButton()

        // Do any additional setup after loading the view.
    }
    
    //MARK:- Button actions
    @objc func tapOnLogin() {
        debugPrint("Tap on login")
        UIApplication.shared.windows.first?.rootViewController = UIStoryboard.getContainerView()
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    

    // MARK: - Navigation

    private func configureButton() {
        view.addSubview(loginButton)
        loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        loginButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
    }

}

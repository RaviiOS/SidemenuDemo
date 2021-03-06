//
//  InfoViewController.swift
//  SidemenuDemo
//
//  Created by Ravi kumar Yaganti on 20/07/20.
//  Copyright © 2020 Ravi kumar Yaganti. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    lazy var centerLable: UILabel = {
        let lable = UILabel(frame: .zero)
        lable.font = UIFont(name: "System-Bold", size: 14)
        lable.textColor = .lightGray
        lable.contentMode = .center
        lable.numberOfLines = 0
        lable.sizeToFit()
        lable.translatesAutoresizingMaskIntoConstraints = false
        
        return lable
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        centerLable.text = SideMenuItem.info.rawValue
    }
    

    // MARK: - private methods
    private func setupUI() {
        view.addSubview(centerLable)
        NSLayoutConstraint.activate([
            centerLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            centerLable.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

}

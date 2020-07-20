//
//  ViewController.swift
//  SidemenuDemo
//
//  Created by Ravi kumar Yaganti on 20/07/20.
//  Copyright © 2020 Ravi kumar Yaganti. All rights reserved.
//

import UIKit
import SideMenu
class ContainerViewController: UIViewController {

    //MARK:- Child Controllers
    private let settingsVC = SettingsViewController()
    private let infoVC = InfoViewController()
    
    //MARK:- SideMenu
    private var sideMenu: SideMenuNavigationController?
    let menu = MenuController(with: SideMenuItem.allCases)
    
    //MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let vc = FirstVC()
        vc.view.backgroundColor = .lightGray
        configureSideMenu()
    }
    
    //MARK:- Configure SideMenu
    fileprivate func configureSideMenu() {
        sideMenu = SideMenuNavigationController(rootViewController: menu)
        menu.delegate = self
        sideMenu?.leftSide = true
        sideMenu?.setNavigationBarHidden(true, animated: false)
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        addChildControllers()
    }

    //MARK:- Button actions
    @IBAction func didTapOnMenu() {
        present(sideMenu!, animated: true)
    }
    
    //MARK:- Private methods
    private func addChildControllers() {
        addChild(self.settingsVC)
        addChild(self.infoVC)
        view.addSubview(settingsVC.view)
        view.addSubview(infoVC.view)
        settingsVC.view.frame = view.bounds
        infoVC.view.frame = view.bounds
        
        settingsVC.didMove(toParent: self)
        infoVC.didMove(toParent: self)
        
        settingsVC.view.isHidden = true
        infoVC.view.isHidden = true
    }
}

extension ContainerViewController: MenuControllerDelegate{
    func didSelectMenuItem(named: SideMenuItem) {
        debugPrint("selected item \(named)")
        self.title = named.rawValue
        sideMenu?.dismiss(animated: true, completion: nil)
        switch named {
        case .home:
            settingsVC.view.isHidden = true
            infoVC.view.isHidden = true
            break
            
        case .info:
            settingsVC.view.isHidden = true
            infoVC.view.isHidden = false
            break
            
        case .settings:
            settingsVC.view.isHidden = false
            infoVC.view.isHidden = true
            break
        case .logout:
            settingsVC.view.isHidden = true
            infoVC.view.isHidden = true
            Helper.logout()
            break
        }
    }
    
    
}


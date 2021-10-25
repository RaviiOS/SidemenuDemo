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
    private let homeVC = HomeVC()
    
    //MARK:- SideMenu
    private var sideMenu: SideMenuNavigationController?
    let menu = MenuController(with: SideMenuItem.allCases)
    
    //MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSideMenu()
    }
    
    //MARK:- Configure SideMenu
    fileprivate func configureSideMenu() {
        sideMenu = SideMenuNavigationController(rootViewController: menu)
        menu.delegate = self
        sideMenu?.leftSide = true
        sideMenu?.setNavigationBarHidden(true, animated: false)
        sideMenu?.presentationStyle = .menuSlideIn // .menuSlideIn , viewSlideOutMenuIn
        sideMenu?.statusBarEndAlpha = 0
        sideMenu?.alwaysAnimate = true
        sideMenu?.statusBarEndAlpha = 2.0
        sideMenu?.presentationStyle.presentingEndAlpha = 0.8
        sideMenu?.presentationStyle.onTopShadowOpacity = 0.5
        sideMenu?.presentationStyle.onTopShadowRadius = 2
        sideMenu?.presentationStyle.onTopShadowColor = .black
        sideMenu?.pushStyle = .popWhenPossible;
        sideMenu?.menuWidth = view.frame.width * 0.75;
        SideMenuManager.default.rightMenuNavigationController = nil
//        SideMenuPresentationStyle.menuSlideIn.backgroundColor = UIColor.purple
        sideMenu?.presentationStyle.backgroundColor = UIColor.systemGroupedBackground
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        addChildControllers()
        self.title = SideMenuItem.home.rawValue
    }

    //MARK:- Button actions
    @IBAction func didTapOnMenu() {
        present(sideMenu!, animated: true)
    }
    
    //MARK:- Private methods
    private func addChildControllers() {
        addChild(self.settingsVC)
        addChild(self.infoVC)
        addChild(self.homeVC)
        view.addSubview(settingsVC.view)
        view.addSubview(infoVC.view)
        view.addSubview(homeVC.view)
        settingsVC.view.frame = view.bounds
        infoVC.view.frame = view.bounds
        homeVC.view.frame = view.bounds
        
        settingsVC.didMove(toParent: self)
        infoVC.didMove(toParent: self)
        homeVC.didMove(toParent: self)
        
        settingsVC.view.isHidden = true
        infoVC.view.isHidden = true
        homeVC.view.isHidden = false
    }
}

extension ContainerViewController: MenuControllerDelegate{
    func didSelectMenuItem(named: SideMenuItem) {
        debugPrint("selected item \(named)")
        self.title = named.rawValue
        sideMenu?.dismiss(animated: true, completion: nil)
        switch named {
        case .home:
            homeVC.view.isHidden = false
            settingsVC.view.isHidden = true
            infoVC.view.isHidden = true
            break
            
        case .info:
            homeVC.view.isHidden = true
            settingsVC.view.isHidden = true
            infoVC.view.isHidden = false
            break
            
        case .settings:
            homeVC.view.isHidden = true
            settingsVC.view.isHidden = false
            infoVC.view.isHidden = true
            break
        case .logout:
            homeVC.view.isHidden = true
            settingsVC.view.isHidden = true
            infoVC.view.isHidden = true
            Helper.logout()
            break
        }
    }
}


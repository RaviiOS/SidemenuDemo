//
//  MenuController.swift
//  SidemenuDemo
//
//  Created by Ravi kumar Yaganti on 20/07/20.
//  Copyright © 2020 Ravi kumar Yaganti. All rights reserved.
//

import UIKit

protocol MenuControllerDelegate {
    func didSelectMenuItem(named: SideMenuItem)
}

enum SideMenuItem: String, CaseIterable {
    case home = "Home"
    case info = "Info"
    case settings = "Settings"
    case logout = "Logout"
}

class MenuController: UITableViewController {
    
    public var delegate: MenuControllerDelegate?
    
    private var menuItems = [SideMenuItem]()
    private let darkColor = UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 0.7)

    lazy var headerView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var usernameLable: UILabel = {
        let lable = UILabel(frame: .zero)
        lable.backgroundColor = .purple
        lable.text = "Ravi Kumar Yaganti"
        lable.textColor = .white
        lable.numberOfLines = 0
        lable.translatesAutoresizingMaskIntoConstraints = false
        
        return lable
    }()
    
    init(with menuItems: [SideMenuItem]) {
        self.menuItems = menuItems
        super.init(nibName: nil, bundle: nil)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.isScrollEnabled = false
        tableView.bounces = false
        tableView.bouncesZoom = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = darkColor
        configureHeaderView()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = menuItems[indexPath.row].rawValue
        cell.textLabel?.textColor = .white
        cell.backgroundColor = .clear
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedItem = menuItems[indexPath.row]
        delegate?.didSelectMenuItem(named: selectedItem)
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 160
    }
    
    //MARK:- Setup header view
    private func configureHeaderView() {
        //TODO- Need to work on headerview

        tableView.tableHeaderView = headerView
        tableView.tableHeaderView?.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 160)
        headerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 160).isActive = true
        
        headerView.addSubview(usernameLable)
        usernameLable.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 10).isActive = true
        usernameLable.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: 100).isActive = true
        usernameLable.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 30).isActive = true
    }
}

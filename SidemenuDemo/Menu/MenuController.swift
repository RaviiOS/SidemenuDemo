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
    
    //MARK:- Properties
    public var delegate: MenuControllerDelegate?
    private var menuItems = [SideMenuItem]()
    private let darkColor = UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 0.7)
    
    //MARK:- Computed properties
    
    lazy var headerView: UIView = {
        let view = UIView(frame: .zero)
//        view.layer.borderWidth = 0.5
//        view.layer.borderColor = UIColor.lightGray.cgColor
        view.backgroundColor = UIColor.systemGroupedBackground.withAlphaComponent(0.4)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
//        imageView.layer.cornerRadius = 50
//        imageView.layer.borderColor = UIColor.lightGray.cgColor
//        imageView.layer.borderWidth = 1
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .purple
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "person")
        return imageView
    }()
    
    lazy var usernameLable: UILabel = {
        let lable = UILabel(frame: .zero)
        lable.text = "Ravi Kumar Yaganti"
        lable.textColor = .lightGray
        lable.textAlignment = .center
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
        tableView.backgroundColor = .white
        configureHeaderView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.systemGroupedBackground
        tableView.separatorColor = .clear
    }
    
    //MARK:- Setup header view
    
    private func configureHeaderView() {
        //TODO- Need to work on headerview
        tableView.tableHeaderView = headerView
        tableView.tableHeaderView?.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 160)
        NSLayoutConstraint.activate([
            headerView.widthAnchor.constraint(equalTo: view.widthAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 160)
        ])
        
        headerView.addSubview(profileImageView)
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 20),
            profileImageView.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            profileImageView.heightAnchor.constraint(equalToConstant: 100),
        ])

        headerView.addSubview(usernameLable)
        NSLayoutConstraint.activate([
            usernameLable.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20),
            usernameLable.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20),
            usernameLable.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 10)
        ])
        
    }
}

//MARK:- Tableview Delegate and data sources

extension MenuController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
        cell.textLabel?.text = menuItems[indexPath.row].rawValue
        cell.textLabel?.textColor = .systemPurple
        cell.contentView.backgroundColor = UIColor.systemGroupedBackground
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedItem = menuItems[indexPath.row]
        delegate?.didSelectMenuItem(named: selectedItem)
    }
}

//
//  NotificationSettingViewController.swift
//  TStoryApp
//
//  Created by Chu Yu Min on 2021/11/21.
//

import UIKit

class NotificationSettingViewController: UIViewController{
    
    var notificationModel: [NotificationModel] = []
    
    lazy var notificationSettingTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        return tableView
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
    }
    
    init(notificationModel: [NotificationModel]){
        super.init(nibName: nil, bundle: nil)
        self.notificationModel = notificationModel
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints(){
        view.backgroundColor = .white
        NSLayoutConstraint.activate([
            notificationSettingTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            notificationSettingTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            notificationSettingTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            notificationSettingTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

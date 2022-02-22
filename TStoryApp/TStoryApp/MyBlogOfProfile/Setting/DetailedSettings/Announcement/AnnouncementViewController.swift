//
//  AnnouncementViewController.swift
//  TStoryApp
//
//  Created by yumin chu on 2021/11/22.
//

import UIKit

class AnnouncementViewController: UIViewController {
    
    var announcementModel: [AnnouncementModel] = []
    
    lazy var announcementTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AnnouncementTableViewHeader.self, forHeaderFooterViewReuseIdentifier: "announcement_header")
        tableView.register(AnnouncementTableViewCell.self, forCellReuseIdentifier: "announcement_cell")
        view.addSubview(tableView)
        return tableView
    } ()
    
    
    init(announcementModel: [AnnouncementModel]){
        self.announcementModel = announcementModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
    }
    
    private func setConstraints(){
        view.backgroundColor = .white
        NSLayoutConstraint.activate([
            announcementTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            announcementTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            announcementTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            announcementTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

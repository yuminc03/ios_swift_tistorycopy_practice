//
//  VisitLogViewController.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/15.
//

import UIKit

class VisitLogViewController: UIViewController {
    
    var visitInfo: [VisitInformation] = []
    var selectedLogSortIndex: Int = 0
    
    lazy var visitInfoTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FullScreenVisitLogTableViewHeader.self, forHeaderFooterViewReuseIdentifier: "full_screen_visit_header")
        tableView.register(FullScreenVisitLogTableViewCell.self, forCellReuseIdentifier: "full_screen_visit_cell")
        view.addSubview(tableView)
        return tableView
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
    }
    
    private func setConstraints() {
        view.backgroundColor = .white
        NSLayoutConstraint.activate([
            visitInfoTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            visitInfoTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            visitInfoTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            visitInfoTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    
    func setVisitInfo(model: [VisitInformation]) {
        self.visitInfo = model
    }
}

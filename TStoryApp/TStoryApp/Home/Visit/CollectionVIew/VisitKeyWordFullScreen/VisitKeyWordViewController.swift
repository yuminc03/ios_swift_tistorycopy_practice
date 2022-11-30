//
//  VisitKeyWordViewController.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/16.
//

import UIKit

class VisitKeyWordViewController: UIViewController {
    
    var visitKeyWords: [VisitKeyWords] = []
    
    lazy var visitKeyWordTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FullScreenVisitKeyWordsTableViewCell.self, forCellReuseIdentifier: "full_screen_visit_key_cell")
        tableView.register(FullScreenVisitKeyWordsTableViewHeader.self, forHeaderFooterViewReuseIdentifier: "full_screen_visit_key_header")
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
            visitKeyWordTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            visitKeyWordTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            visitKeyWordTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            visitKeyWordTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
       
    }
    
    func setVisitKeyWords(model: [VisitKeyWords]) {
        self.visitKeyWords = model
    }
}

//
//  VisitLogViewController.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/15.
//

import UIKit

class VisitLogViewController: UIViewController {
    
    var visitInfo: [VisitInformation] = []
    var selectedLogSortIndex: Int = 0
    var visitLogOverlapDeleteArr: [String] = [] //url중복을 제거한 array
    var visitLogArr: [String] = [] //url만 있는 array
    var logCount: [Int] = [] //url중복을 세는 array
    
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
        tableView.register(FullScreenVisitLogSortTableViewCell.self, forCellReuseIdentifier: "full_screen_visit_sort_cell")
        view.addSubview(tableView)
        return tableView
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
        configulations()
    }
    
    init(visitInfo: [VisitInformation]) {
        super.init(nibName: nil, bundle: nil)
        self.visitInfo = visitInfo
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
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
    
    func configulations() {
        for i in 0 ..< visitInfo.count {
            self.visitLogArr.append(visitInfo[i].visitUrl)
        }
        createUrlArray(url: visitLogArr)
        logCount(arr1: self.visitLogOverlapDeleteArr, arr2: self.visitLogArr)
    }
    
    func createUrlArray(url: [String]){
        let urlSet = Set(url)
        self.visitLogOverlapDeleteArr = Array(urlSet)
    }
    
    func logCount(arr1: [String], arr2: [String]) {
        self.logCount = Array(repeating: 0, count: visitLogOverlapDeleteArr.count)
        for i in 0 ..< arr1.count {
            for j in 0 ..< arr2.count {
                if arr1[i] == arr2[j] {
                    self.logCount[i] += 1
                }
            }
        }
    }
}

//
//  VisitLogCollectionViewCell.swift
//  TStoryApp
//
//  Created by yumin chu on 2021/11/15.
//

import UIKit

class VisitLogCollectionViewCell: UICollectionViewCell {
    
    var visitInfo: [VisitInformation] = []
    
    lazy var visitLogTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isUserInteractionEnabled = false
        tableView.register(VisitLogTableHeaderView.self, forHeaderFooterViewReuseIdentifier: "visit_log_header")
        tableView.register(VisitLogTableViewCell.self, forCellReuseIdentifier: "visit_log_cell")
        addSubview(tableView)
        return tableView
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            visitLogTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            visitLogTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            visitLogTableView.topAnchor.constraint(equalTo: topAnchor),
            visitLogTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setCellStyle() {
        backgroundColor = .white
        layer.cornerRadius = 10
        layer.masksToBounds = false
        layer.borderWidth = 0.1
        layer.borderColor = UIColor.lightGray.cgColor
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 4
    }
    
    func setVisitInfoModel(model: [VisitInformation]) {
        self.visitInfo = model
    }
}

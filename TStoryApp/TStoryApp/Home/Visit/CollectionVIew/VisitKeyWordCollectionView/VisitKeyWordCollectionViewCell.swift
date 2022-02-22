//
//  VisitKeyWordCollectionViewCell.swift
//  TStoryApp
//
//  Created by yumin chu on 2021/11/15.
//

import UIKit

class VisitKeyWordCollectionViewCell: UICollectionViewCell {
    
    var visitKeyWords: [VisitKeyWords] = []
    
    lazy var visitKeyWordTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isUserInteractionEnabled = false
        tableView.register(VisitKeyWordTableHeaderView.self, forHeaderFooterViewReuseIdentifier: "visit_key_header")
        tableView.register(VisitKeyWordTableViewCell.self, forCellReuseIdentifier: "visit_key_cell")
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
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            visitKeyWordTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            visitKeyWordTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            visitKeyWordTableView.topAnchor.constraint(equalTo: topAnchor),
            visitKeyWordTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
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
    
    func setVisitKeyWords(model: [VisitKeyWords]) {
        self.visitKeyWords = model
    }
}

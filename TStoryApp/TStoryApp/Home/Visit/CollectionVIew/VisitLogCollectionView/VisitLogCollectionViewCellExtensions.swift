//
//  VisitLogCollectionViewCellExtensions.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/15.
//

import UIKit

extension VisitLogCollectionViewCell: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return visitInfo.count <= 5 ? visitInfo.count : 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = visitInfo[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "visit_log_cell", for: indexPath) as! VisitLogTableViewCell
        cell.setComponentData(url: data.visitUrl, date: data.visitDate)
        cell.visitLogIcon.backgroundColor = .systemBlue.withAlphaComponent(CGFloat(indexPath.row + 1) * 0.2)
        cell.selectionStyle = .none
        cell.contentView.isUserInteractionEnabled = false
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "visit_log_header") as! VisitLogTableHeaderView
        return header
    }

}

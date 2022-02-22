//
//  VisitLogCollectionViewCellExtensions.swift
//  TStoryApp
//
//  Created by yumin chu on 2021/11/15.
//

import UIKit

extension VisitLogCollectionViewCell: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return min(visitInfo.count, 5)//값 둘 중에서 더 작은 값 반환
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

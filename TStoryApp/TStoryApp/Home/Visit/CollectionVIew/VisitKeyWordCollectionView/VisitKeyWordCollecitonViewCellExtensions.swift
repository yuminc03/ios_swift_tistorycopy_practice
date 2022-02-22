//
//  VisitKeyWordCollecitonViewCellExtensions.swift
//  TStoryApp
//
//  Created by yumin chu on 2021/11/15.
//

import UIKit

extension VisitKeyWordCollectionViewCell: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return visitKeyWords.count <= 3 ? visitKeyWords.count : 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = visitKeyWords[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "visit_key_cell", for: indexPath) as! VisitKeyWordTableViewCell
        cell.selectionStyle = .none
        cell.setVisitKeyWordsText(keyWord: data.visitKeyWord, count: data.keyWordCount)
        cell.contentView.isUserInteractionEnabled = false
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "visit_key_header") as! VisitKeyWordTableHeaderView
        return header
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
}

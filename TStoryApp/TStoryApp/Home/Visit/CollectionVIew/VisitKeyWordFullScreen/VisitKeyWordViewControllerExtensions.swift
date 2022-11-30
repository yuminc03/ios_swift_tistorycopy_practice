//
//  VisitKeyWordViewControllerExtensions.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/16.
//

import UIKit
import WebKit

extension VisitKeyWordViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return visitKeyWords.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = visitKeyWords[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "full_screen_visit_key_cell") as! FullScreenVisitKeyWordsTableViewCell
        cell.setVisitKeyWordsText(keyWord: data.visitKeyWord, count: data.keyWordCount)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "full_screen_visit_key_header") as! FullScreenVisitKeyWordsTableViewHeader
        header.dismissViewControllerButton.addTarget(self, action: #selector(dismissViewControllerButtonDidTapped), for: .touchUpInside)
        return header
    }
    
    @objc private func dismissViewControllerButtonDidTapped(button: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

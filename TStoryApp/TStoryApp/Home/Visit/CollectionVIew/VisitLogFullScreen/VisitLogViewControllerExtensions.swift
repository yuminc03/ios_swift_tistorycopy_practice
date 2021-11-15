//
//  VisitLogViewControllerExtensions.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/15.
//

import UIKit

extension VisitLogViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = visitInfo[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "full_screen_visit_cell", for: indexPath) as! FullScreenVisitLogTableViewCell
        cell.setComponentData(url: data.visitUrl, date: data.visitDate)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "full_screen_visit_header") as! FullScreenVisitLogTableHeaderView
        header.backToControllerButton.addTarget(self, action: #selector(backToControllerButtonDidTapped), for: .touchUpInside)
        return header
    }
    
    @objc private func backToControllerButtonDidTapped(button: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

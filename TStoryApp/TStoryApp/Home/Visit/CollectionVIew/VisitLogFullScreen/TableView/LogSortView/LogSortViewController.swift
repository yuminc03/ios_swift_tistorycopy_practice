//
//  LogSortViewController.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/16.
//

import UIKit

protocol LogSortViewControllerDelegate: AnyObject {
    func LogSortViewDidTapped(_ viewController: LogSortViewController, at: Int?)
}
class LogSortViewController: UIViewController {
    
    weak var delegate: LogSortViewControllerDelegate?
    var isSelected: Int = 0

    lazy var logSortView: LogSortView = {
        let logSortView = LogSortView()
        logSortView.translatesAutoresizingMaskIntoConstraints = false
        logSortView.backgroundColor = .white
        logSortView.layer.cornerRadius = 10
        logSortView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        logSortView.setStackView()
        logSortView.delegate = self
        logSortView.setIsSelected(index: isSelected)
        view.addSubview(logSortView)
        return logSortView
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(LogSortViewBackgroundDidTapped))
        view.addGestureRecognizer(gesture)
        setConstraints()
    }
    
    private func setConstraints() {
        view.backgroundColor = .black.withAlphaComponent(0.1)
        NSLayoutConstraint.activate([
            logSortView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            logSortView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            logSortView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc private func LogSortViewBackgroundDidTapped(gesture: UITapGestureRecognizer) {
        let location = gesture.location(in: self.view)
        if logSortView.frame.contains(location) {
            return
        }
        else {
            delegate?.LogSortViewDidTapped(self, at: nil)
        }
    }
}

//
//  VisitHeaderView.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/11.
//

import UIKit

class VisitTableViewHeader: UITableViewHeaderFooterView {
    
    lazy var myBlogNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        addSubview(label)
        return label
    } ()
    
    lazy var myBlogUrlLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.textColor = .lightGray
        addSubview(label)
        return label
    } ()
    
    lazy var currentPageViewFirst: VisitHeaderComponentsView = {
        let currentPageView = VisitHeaderComponentsView()
        currentPageView.translatesAutoresizingMaskIntoConstraints = false
        currentPageView.layer.cornerRadius = 3
        currentPageView.backgroundColor = .lightGray.withAlphaComponent(0.5)
        addSubview(currentPageView)
        return currentPageView
    } ()
    
    lazy var currentPageViewSecond: VisitHeaderComponentsView = {
        let currentPageView = VisitHeaderComponentsView()
        currentPageView.translatesAutoresizingMaskIntoConstraints = false
        currentPageView.layer.cornerRadius = 3
        currentPageView.backgroundColor = .lightGray.withAlphaComponent(0.5)
        addSubview(currentPageView)
        return currentPageView
    } ()
    
    lazy var currentPageViewThird: VisitHeaderComponentsView = {
        let currentPageView = VisitHeaderComponentsView()
        currentPageView.translatesAutoresizingMaskIntoConstraints = false
        currentPageView.layer.cornerRadius = 3
        currentPageView.backgroundColor = .lightGray.withAlphaComponent(0.5)
        addSubview(currentPageView)
        return currentPageView
    } ()
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            myBlogNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            myBlogNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15)
        ])
        
        NSLayoutConstraint.activate([
            myBlogUrlLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            myBlogUrlLabel.topAnchor.constraint(equalTo: myBlogNameLabel.bottomAnchor, constant: 5),
            myBlogUrlLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
        
        NSLayoutConstraint.activate([
            currentPageViewFirst.trailingAnchor.constraint(equalTo: currentPageViewSecond.leadingAnchor, constant: -5),
            currentPageViewFirst.centerYAnchor.constraint(equalTo: myBlogUrlLabel.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            currentPageViewSecond.trailingAnchor.constraint(equalTo: currentPageViewThird.leadingAnchor, constant: -5),
            currentPageViewSecond.centerYAnchor.constraint(equalTo: myBlogUrlLabel.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            currentPageViewThird.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            currentPageViewThird.centerYAnchor.constraint(equalTo: myBlogUrlLabel.centerYAnchor)
        ])
    }
    
    func setVisitHeaderData(name: String, url: String) {
        myBlogNameLabel.text = name
        myBlogUrlLabel.text = url
    }
}

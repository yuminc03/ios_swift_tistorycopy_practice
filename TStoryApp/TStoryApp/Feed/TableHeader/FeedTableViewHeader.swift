//
//  FeedHeaderView.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/10.
//

import UIKit

class FeedTableViewHeader: UITableViewHeaderFooterView {
 
    lazy var feedTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "피드"
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textColor = .black
        addSubview(label)
        return label
    } ()
    
    private lazy var subscribingView: FeedSubscribeComponentsView = {
        let components = FeedSubscribeComponentsView(label: "구독중", num: 0)
        components.translatesAutoresizingMaskIntoConstraints = false
        addSubview(components)
        return components
    } ()
    
    private lazy var subscriberView: FeedSubscribeComponentsView = {
        let components = FeedSubscribeComponentsView(label: "구독자", num: 0)
        components.translatesAutoresizingMaskIntoConstraints = false
        addSubview(components)
        return components
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
            feedTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            feedTitle.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            subscribingView.trailingAnchor.constraint(equalTo: subscriberView.leadingAnchor, constant: -25),
            subscribingView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            subscriberView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            subscriberView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func setSubscribeNumData(subscribingNum: Int, subscriberNum: Int) {
        subscribingView.setNumLabelText(num: subscribingNum)
        subscriberView.setNumLabelText(num: subscriberNum)
    }
}


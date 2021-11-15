//
//  VisitCollectionViewCell.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/12.
//

import UIKit

class VisitCollectionViewCell: UICollectionViewCell {

    lazy var visitGraphView: VisitGraphView = {
        let visitView = VisitGraphView()
        visitView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(visitView)
        return visitView
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
            visitGraphView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            visitGraphView.topAnchor.constraint(equalTo: topAnchor, constant: 30)
        ])
    }

}

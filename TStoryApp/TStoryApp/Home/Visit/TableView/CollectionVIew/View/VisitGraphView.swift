//
//  VisitGraphView.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/12.
//

import UIKit

class VisitGraphView: UIView {
    
    lazy var firstSeperator: VisitGraphDateLineView = {
        let seperator = VisitGraphDateLineView()
        seperator.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(seperator)
        return seperator
    } ()
    
    lazy var secondSeperator: VisitGraphDateLineView = {
        let seperator = VisitGraphDateLineView()
        seperator.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(seperator)
        return seperator
    } ()
    
    lazy var thirdSeperator: VisitGraphDateLineView = {
        let seperator = VisitGraphDateLineView()
        seperator.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(seperator)
        return seperator
    } ()
    
    lazy var fourthSeperator: VisitGraphDateLineView = {
        let seperator = VisitGraphDateLineView()
        seperator.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(seperator)
        return seperator
    } ()
    
    lazy var fifthSeperator: VisitGraphDateLineView = {
        let seperator = VisitGraphDateLineView()
        seperator.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(seperator)
        return seperator
    } ()
    
    lazy var sixthSeperator: VisitGraphDateLineView = {
        let seperator = VisitGraphDateLineView()
        seperator.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(seperator)
        return seperator
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints() {
        self.backgroundColor = .white
        self.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        self.layer.borderWidth = 1
        
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: 310),
            self.heightAnchor.constraint(equalToConstant: 120)
        ])
        
        NSLayoutConstraint.activate([
            firstSeperator.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 44),
            firstSeperator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            secondSeperator.leadingAnchor.constraint(equalTo: firstSeperator.trailingAnchor, constant: 44),
            secondSeperator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            thirdSeperator.leadingAnchor.constraint(equalTo: secondSeperator.trailingAnchor, constant: 44),
            thirdSeperator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            fourthSeperator.leadingAnchor.constraint(equalTo: thirdSeperator.trailingAnchor, constant: 44),
            fourthSeperator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            fifthSeperator.leadingAnchor.constraint(equalTo: fourthSeperator.trailingAnchor, constant: 44),
            fifthSeperator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            sixthSeperator.leadingAnchor.constraint(equalTo: fifthSeperator.trailingAnchor, constant: 44),
            sixthSeperator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
}

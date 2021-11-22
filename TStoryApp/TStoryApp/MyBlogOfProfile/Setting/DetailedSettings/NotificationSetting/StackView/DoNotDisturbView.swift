//
//  DoNotDistrubView.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/22.
//

import UIKit

class DoNotDisturbView: UIView {
    
    private var cellName: String = ""
    private var isSelected: Bool = false
    
    lazy var disturbStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        addSubview(stackView)
        return stackView
    } ()
    
    lazy var cellNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.text = cellName
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .light)
        addSubview(label)
        return label
    } ()
    
    lazy var timeSelectView: TimeSelectView = {
        let timeView = TimeSelectView(time: "오전 00:00 ~ 오전 07:00")
        timeView.translatesAutoresizingMaskIntoConstraints = false
        timeView.backgroundColor = .white
        return timeView
    } ()
    
    init(cellName: String, isSelected: Bool, switchControlSize: CGRect){
        super.init(frame: .zero)
        self.cellName = cellName
        self.isSelected = isSelected
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func setUI(isSelected: Bool) {
        for subview in disturbStackView.arrangedSubviews {
            subview.removeFromSuperview()
        }
        
        switch isSelected {
        case true :
            disturbStackView.addArrangedSubview(timeSelectView)
            timeSelectView.heightAnchor.constraint(equalToConstant: 50).isActive = true
            break
        case false :
            for subview in disturbStackView.arrangedSubviews {
                subview.removeFromSuperview()
            }
            break
        default: return
        }
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            cellNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cellNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            cellNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15)
        ])
    }
    
}

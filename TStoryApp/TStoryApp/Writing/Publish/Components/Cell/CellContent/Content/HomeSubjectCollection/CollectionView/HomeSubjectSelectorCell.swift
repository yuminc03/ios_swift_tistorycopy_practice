//
//  HomeSubjectSelectorCell\.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/09.
//

import UIKit

class HomeSubjectSelectorCell: UICollectionViewCell {
    
    var homeSubjectName: String = ""
    
    lazy var homeSubjectSelectorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.textColor = .black
        contentView.addSubview(label)
        return label
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
            homeSubjectSelectorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            homeSubjectSelectorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            homeSubjectSelectorLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func setHomeSubjectSelectorCellData(data: String) {
        homeSubjectSelectorLabel.text = data
    }
    
    func initalize() {
        layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        homeSubjectSelectorLabel.textColor = .black
    }
    
    func setHomeSubjectSelectorCell(name: String) {
        self.homeSubjectName = name
        initalize()
        
        if homeSubjectSelectorLabel.text == name {
            setUI(isSelected: true)
        }
    }
    func setUI(isSelected: Bool) {
        self.layer.borderColor = isSelected ? UIColor.red.cgColor : UIColor.lightGray.withAlphaComponent(0.5).cgColor
        homeSubjectSelectorLabel.textColor = isSelected ? .red : .black
    }
}

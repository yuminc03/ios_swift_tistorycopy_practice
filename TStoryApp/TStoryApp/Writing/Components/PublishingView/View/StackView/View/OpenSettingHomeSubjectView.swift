//
//  OpenSettingHomeSubjectView.swift
//  TStoryApp
//
//  Created by Chu Yu Min on 2021/11/04.
//

import UIKit

class OpenSettingHomeSubjectView: UIView {
    
    var homeSubjectLabel : String = ""
    
    lazy var homeSubjectTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "홈주제"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .light)
        addSubview(label)
        return label
    }()
    
    lazy var homeSubjectButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("선택 안 함 >", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
        addSubview(button)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            homeSubjectTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            homeSubjectTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        NSLayoutConstraint.activate([
            homeSubjectButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            homeSubjectButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            homeSubjectButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        let line = devidedLineViewFunc()
        self.addSubview(line)
        NSLayoutConstraint.activate([
            line.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            line.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            line.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            line.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
    
    func devidedLineViewFunc() -> UIView {//선 그리기
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray.withAlphaComponent(0.3)
        return view
    }
    
    func setHomeSubject(subjectText: String) {
        self.homeSubjectLabel = subjectText
        homeSubjectButton.setTitle(homeSubjectLabel + "  >", for: .normal)
    }
}

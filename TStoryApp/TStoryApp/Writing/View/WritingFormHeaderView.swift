//
//  WritingFormHeaderView.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/10/29.
//

import UIKit

class WritingFormHeaderView: UIView {
    
    var formSaveNum: Int = 0
    
    lazy var formDismissLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        label.text = "✕"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .bold)
        addSubview(label)
        return label
    }()
    
    lazy var formSaveButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 18
        
        let line : String = " | "
        let text : String = "저장 " + "\(line)" + " \(formSaveNum)"
        button.setTitle(text, for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        let mutable = NSMutableAttributedString(string: text)
        let range = (text as NSString).range(of: "\(line)")
        mutable.addAttribute(.foregroundColor, value: UIColor.lightGray.withAlphaComponent(0.5), range: range)
        button.setAttributedTitle(mutable, for: .normal)
        
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 18)
        addSubview(button)
        return button
    }()
    
    lazy var formCompletionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("완료", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 18)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        button.layer.cornerRadius = 18
        addSubview(button)
        return button
    }()
    
    lazy var formDividedLineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        addSubview(view)
        return view
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
            formDismissLabel.widthAnchor.constraint(equalToConstant: 20),
            formDismissLabel.heightAnchor.constraint(equalToConstant: 20),
            formDismissLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            formDismissLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            formSaveButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
            formSaveButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            formSaveButton.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        NSLayoutConstraint.activate([
            formCompletionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            formCompletionButton.centerYAnchor.constraint(equalTo:
                                                            centerYAnchor),
            formCompletionButton.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        NSLayoutConstraint.activate([
            formDividedLineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            formDividedLineView.trailingAnchor.constraint(equalTo: trailingAnchor),
            formDividedLineView.bottomAnchor.constraint(equalTo: bottomAnchor),
            formDividedLineView.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
    
    func setFormSaveNum(formSaveNum: Int) {
        self.formSaveNum = formSaveNum
    }
}

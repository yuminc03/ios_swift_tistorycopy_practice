//
//  OpenSettingCommentIsAllow.swift
//  TStoryApp
//
//  Created by Chu Yu Min on 2021/11/04.
//

import UIKit

class OpenSettingCommentIsAllowView: UIView {
    
    lazy var allowCommentTitle : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "댓글 허용"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .light)
        addSubview(label)
        return label
    }()
    
    lazy var allowCommentSwitch: UISwitch = { //댓글허용 스위치 버튼
        let switchBtn = UISwitch()
        switchBtn.translatesAutoresizingMaskIntoConstraints = false
        switchBtn.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        switchBtn.tintColor = UIColor.lightGray
        switchBtn.onTintColor = UIColor.gray
        switchBtn.isOn = true
        addSubview(switchBtn)
        return switchBtn
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
            allowCommentTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            allowCommentTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        NSLayoutConstraint.activate([
            allowCommentSwitch.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            allowCommentSwitch.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        let upLine = devidedLineViewFunc()
        self.addSubview(upLine)
        NSLayoutConstraint.activate([
            upLine.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            upLine.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            upLine.topAnchor.constraint(equalTo: self.topAnchor),
            upLine.heightAnchor.constraint(equalToConstant: 0.5)
        ])
        
        let downLine = devidedLineViewFunc()
        self.addSubview(downLine)
        NSLayoutConstraint.activate([
            downLine.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            downLine.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            downLine.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            downLine.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
    
    func devidedLineViewFunc() -> UIView {//선 그리기
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray.withAlphaComponent(0.3)
        return view
    }
    
    func setallowCommentSwitch(allow: Bool) {
        allowCommentSwitch.isOn = allow
    }
}

//
//  OpenSettingStackView.swift
//  TStoryApp
//
//  Created by Chu Yu Min on 2021/11/01.
//

import UIKit

class OpenSettingStackView: UIStackView {
    
    var writeFormModel : [WriteFormModel] = []

    lazy var homeSubjectView: OpenSettingHomeSubjectView = {
        let homeSubjectView = OpenSettingHomeSubjectView()
        homeSubjectView.translatesAutoresizingMaskIntoConstraints = false
        homeSubjectView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        homeSubjectView.backgroundColor = .white
        return homeSubjectView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.addArrangedSubview(publishDateStackView)
        return stackView
    } ()
    
    lazy var publishDateStackView: OpenSettingPublishDateStackView = {
        let publishDateStackView = OpenSettingPublishDateStackView()
        publishDateStackView.translatesAutoresizingMaskIntoConstraints = false
        publishDateStackView.backgroundColor = .white
        publishDateStackView.isUserInteractionEnabled = true
        return publishDateStackView
    }()
    
    lazy var commentIsAllowView: OpenSettingCommentIsAllowView = {
        let commentIsAllowView = OpenSettingCommentIsAllowView()
        commentIsAllowView.translatesAutoresizingMaskIntoConstraints = false
        commentIsAllowView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        commentIsAllowView.backgroundColor = .white
        return commentIsAllowView
    }()
    
    lazy var passWordView: OpenSettingPassWordView = {
        let passWordView = OpenSettingPassWordView()
        passWordView.translatesAutoresizingMaskIntoConstraints = false
        passWordView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        passWordView.backgroundColor = .white
        return passWordView
    }()

//    lazy var extendable: UIStackView = {
//       let stackView = UIStackView()
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.axis = .vertical
//        let button = UIButton()
//        button.setTitle("click", for: .normal)
//        button.setTitleColor(.black, for: .normal)
//        button.addTarget(self, action: #selector(extendButtonDidTapped), for: .touchUpInside)
//        stackView.addArrangedSubview(button)
//        return stackView
//    }()
//
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints() {
        
    }
//    var extended: Bool = false
//    @objc private func extendButtonDidTapped() {
//        if extended {
//            extendable.arrangedSubviews.last?.removeFromSuperview()
//            extended = false
//            return
//        }
//        extended = true
//        let test = UIView()
//        test.translatesAutoresizingMaskIntoConstraints = false
//        test.backgroundColor = .lightGray
//        extendable.addArrangedSubview(test)
//        NSLayoutConstraint.activate([
//            test.widthAnchor.constraint(equalTo: extendable.widthAnchor),
//            test.heightAnchor.constraint(equalToConstant: 50)
//        ])
//    }
    
    func setStackView(tag: Int) {
        
        for subview in self.arrangedSubviews {
            subview.removeFromSuperview()//view에서 모든 요소 지우기
        }
        
        let viewCount = tag == 4 ? 1 : 3
        for i in 0 ..< viewCount {
//            if i == 0 {
//                addArrangedSubview(extendable)
//            }
//            var settingView = UIView()
//            settingView.backgroundColor = .white
//            settingView.translatesAutoresizingMaskIntoConstraints = false
//            settingView.layer.borderWidth = 1
//            settingView.layer.borderColor = UIColor.black.cgColor
//            settingView.backgroundColor = tag == 0 ? .red : (tag == 2 ? .blue : .brown)
            
            if tag == 0 {
                if i == 0 { addArrangedSubview(homeSubjectView) }
                else if i == 1 {
                    
                    addArrangedSubview(stackView)
                    NSLayoutConstraint.activate([
                        stackView.heightAnchor.constraint(equalToConstant: 50)
                    ])
                }
                else { addArrangedSubview(commentIsAllowView) }
            }
            else if tag == 2 {
                if i == 0 { addArrangedSubview(passWordView) }
                else if i == 1 {
                    addArrangedSubview(stackView)
                    NSLayoutConstraint.activate([
                        stackView.heightAnchor.constraint(equalToConstant: 50)
                    ])
                }
                else { addArrangedSubview(commentIsAllowView) }
            }
            else if tag == 4 {
                if i == 0 { addArrangedSubview(commentIsAllowView) }
                else { return }
            }
            else { return }
            
//            self.addArrangedSubview(settingView)
//            settingView.heightAnchor.constraint(equalToConstant: 50).isActive = true
            
        }
    }
    
    func devidedLineViewFunc() -> UIView {//선 그리기
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray.withAlphaComponent(0.3)
        return view
    }
    
    func setWriteFormData(writeFormData: [WriteFormModel]) {
        self.writeFormModel = writeFormData
    }
    
    func setAllowCommentSwitchData(switchValue: Bool) {
        self.writeFormModel[0].publishSettingForm[0].allowComment = switchValue
    }
    
    func getAllowComment() -> Bool {
        return self.writeFormModel[0].publishSettingForm[0].allowComment
    }

}

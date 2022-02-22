//
//  AccountSettingView.swift
//  TStoryApp
//
//  Created by yumin chu on 2021/11/18.
//

import UIKit

class AccountSettingView: UIView {
    
    var myBlogOfProfileModel = MyBlogOfProfileModel()
    
    lazy var topView: TopView = {
        let topView = TopView()
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = .white
        addSubview(topView)
        return topView
    } ()
    
    lazy var profileSettingView: ProfileSettingView = {
        let settingView = ProfileSettingView()
        settingView.translatesAutoresizingMaskIntoConstraints = false
        settingView.backgroundColor = .white
        addSubview(settingView)
        return settingView
    } ()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            topView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            topView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            profileSettingView.leadingAnchor.constraint(equalTo: leadingAnchor),
            profileSettingView.trailingAnchor.constraint(equalTo: trailingAnchor),
            profileSettingView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            profileSettingView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setMyBlogOfProfileModel(model: MyBlogOfProfileModel){
        self.myBlogOfProfileModel = model
    }

}

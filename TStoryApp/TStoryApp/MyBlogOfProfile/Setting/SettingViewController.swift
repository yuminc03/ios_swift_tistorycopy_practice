//
//  SettingViewController.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/18.
//

import UIKit


class SettingViewController: UIViewController {
    
    var myBlogOfProfileModel = MyBlogOfProfileModel()
    
    lazy var settingTopView: SettingTopView = {
        let topView = SettingTopView()
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = .white
        topView.dismissSettingViewButton.addTarget(self, action: #selector(dismissSettingViewButtonDidTapped), for: .touchUpInside)
        view.addSubview(topView)
        return topView
    } ()
    
    lazy var settingStackView: SettingStackView = {
        let stackView = SettingStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .clear
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.setMyBlogOfProfileModel(model: self.myBlogOfProfileModel)
        stackView.setAccountSetting()
        stackView.setRepBlogSetting()
        stackView.setAlarmSetting()
        stackView.setAppInfoSetting()
        stackView.setStackView()
        stackView.delegate = self
        view.addSubview(stackView)
        return stackView
    } ()
    
    lazy var lightGrayColorView: UIView = {
        let lightGrayView = UIView()
        lightGrayView.translatesAutoresizingMaskIntoConstraints = false
        lightGrayView.backgroundColor = .lightGray.withAlphaComponent(0.3)
        view.addSubview(lightGrayView)
        return lightGrayView
    } ()
    
    init(myBlogOfProfileModel: MyBlogOfProfileModel) {
        self.myBlogOfProfileModel = myBlogOfProfileModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
    }
    
    private func setConstraints(){
        view.backgroundColor = .white
        NSLayoutConstraint.activate([
            settingTopView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            settingTopView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            settingTopView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            settingTopView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -680)
        ])
        
        NSLayoutConstraint.activate([
            settingStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            settingStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            settingStackView.topAnchor.constraint(equalTo: settingTopView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            lightGrayColorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            lightGrayColorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            lightGrayColorView.topAnchor.constraint(equalTo: settingStackView.bottomAnchor),
            lightGrayColorView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc private func dismissSettingViewButtonDidTapped(button: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
}

//
//  AccountSettingViewController.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/18.
//

import UIKit

class AccountSettingViewController: UIViewController {
    
    var myBlogOfProfileModel = MyBlogOfProfileModel()
    
    lazy var accountSettingView: AccountSettingView = {
        let settingView = AccountSettingView()
        settingView.translatesAutoresizingMaskIntoConstraints = false
        settingView.backgroundColor = .white
        settingView.topView.dismissAccountSettingViewButton.addTarget(self, action: #selector(dismissAccountSettingViewButtonDidTapped), for: .touchUpInside)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(nicknameUpdateViewDidTapped))
        settingView.profileSettingView.nicknameUpdateView.addGestureRecognizer(gesture)
        view.addSubview(settingView)
        settingView.setMyBlogOfProfileModel(model: self.myBlogOfProfileModel)
        settingView.profileSettingView.setProfileSetting(name: myBlogOfProfileModel.profileName, email: myBlogOfProfileModel.profileEmail)
        return settingView
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
    }
    
    init(myBlogOfProfileModel: MyBlogOfProfileModel) {
        self.myBlogOfProfileModel = myBlogOfProfileModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints() {
        view.backgroundColor = .white
        NSLayoutConstraint.activate([
            accountSettingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            accountSettingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            accountSettingView.topAnchor.constraint(equalTo: view.topAnchor),
            accountSettingView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc private func dismissAccountSettingViewButtonDidTapped(button: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @objc private func nicknameUpdateViewDidTapped(gesture: UITapGestureRecognizer){
        let vc = ChangeNicknameViewController(myBlogOfProfileModel: self.myBlogOfProfileModel)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}

//
//  AccountSettingViewController.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/18.
//

import UIKit

protocol AccountSettingViewControllerDelegate: AnyObject {
    func getProflieName(name: String)
}
class AccountSettingViewController: UIViewController {
    
    var myBlogOfProfileModel = MyBlogOfProfileModel()
    weak var delegate: AccountSettingViewControllerDelegate?
    var settingButtonIndex: Int? = 0
    
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
        delegate?.getProflieName(name: accountSettingView.profileSettingView.profileNameLabel.text!)
        self.dismiss(animated: false, completion: nil)
    }
    
    @objc private func nicknameUpdateViewDidTapped(gesture: UITapGestureRecognizer){
        let vc = ChangeNicknameViewController(myBlogOfProfileModel: self.myBlogOfProfileModel)
        vc.modalPresentationStyle = .fullScreen
        vc.delegate = self
        self.present(vc, animated: true)
    }
    
    func getMyProfileName() -> String {
        return myBlogOfProfileModel.profileName
    }
    
    func setSettingButtonIndex(index: Int) {
        self.settingButtonIndex = index
    }
}

extension AccountSettingViewController: ChangeNicknameViewControllerDelegate {
    func getChangeNickname(name: String) {
        accountSettingView.profileSettingView.profileNameLabel.text = name
    }
}

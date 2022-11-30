//
//  AppInformationViewController.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/22.
//

import UIKit

class AppInformationViewController: UIViewController {
    
    var myBlogOfProfileModal = MyBlogOfProfileModel()
    
    lazy var topView: AppInformationTopView = {
        let topView = AppInformationTopView()
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = .white
        topView.dismissAppInformationButton.addTarget(self, action: #selector(dismissAppInformationButtonDidTapped), for: .touchUpInside)
        view.addSubview(topView)
        return topView
    } ()
    
    lazy var appInfoView: AppInformationView = {
        let appInfoView = AppInformationView(appVersion: myBlogOfProfileModal.appVersion)
        appInfoView.translatesAutoresizingMaskIntoConstraints = false
        appInfoView.backgroundColor = .white
        view.addSubview(appInfoView)
        return appInfoView
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
    }
    
    init(myBlogOfProfileModal: MyBlogOfProfileModel){
        self.myBlogOfProfileModal = myBlogOfProfileModal
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.heightAnchor.constraint(equalToConstant: 150)
        ])
        NSLayoutConstraint.activate([
            appInfoView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            appInfoView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            appInfoView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            appInfoView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc private func dismissAppInformationButtonDidTapped(button: UIButton){
        self.dismiss(animated: false, completion: nil)
    }
}

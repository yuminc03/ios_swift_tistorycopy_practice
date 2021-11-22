//
//  NotificationSettingViewController.swift
//  TStoryApp
//
//  Created by Chu Yu Min on 2021/11/21.
//

import UIKit

class NotificationSettingViewController: UIViewController{
    
    var notificationModel = NotificationModel()
    
    lazy var notificationSettingTopView: NotificationSettingTopView = {
        let topView = NotificationSettingTopView()
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = .white
        topView.dismissNotificationSettingButton.addTarget(self, action: #selector(dismissNotificationSettingButtonDidTapped), for: .touchUpInside)
        view.addSubview(topView)
        return topView
    } ()
    
    lazy var notificationSettingStackView: NotificationSettingStackView = {
        let stackView = NotificationSettingStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .clear
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.setNotificationModel(model: notificationModel)
        stackView.setStackView()
        view.addSubview(stackView)
        return stackView
    } ()
    
    lazy var lightGrayColorView: UIView = {
        let colorView = UIView()
        colorView.translatesAutoresizingMaskIntoConstraints = false
        colorView.backgroundColor = .lightGray.withAlphaComponent(0.3)
        view.addSubview(colorView)
        return colorView
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
    }
    
    init(notificationModel: NotificationModel){
        super.init(nibName: nil, bundle: nil)
        self.notificationModel = notificationModel
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints(){
        view.backgroundColor = .white
        NSLayoutConstraint.activate([
            notificationSettingTopView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            notificationSettingTopView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            notificationSettingTopView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            notificationSettingTopView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            notificationSettingStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            notificationSettingStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            notificationSettingStackView.topAnchor.constraint(equalTo: notificationSettingTopView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            lightGrayColorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            lightGrayColorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            lightGrayColorView.topAnchor.constraint(equalTo: notificationSettingStackView.bottomAnchor),
            lightGrayColorView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc private func dismissNotificationSettingButtonDidTapped(button: UIButton){
        self.dismiss(animated: false, completion: nil)
    }
}

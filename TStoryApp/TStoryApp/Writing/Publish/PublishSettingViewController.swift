//
//  PublishingSettingViewcontroller1.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/05.
//

import UIKit

protocol PublishSettingViewDelgate: AnyObject {
    func publishSettingViewControllerDismiss(_ controller: PublishSettingViewController, writeTitleText: String, publishTag: String, categoryName: String, publishSettingIndex: Int, publishDateIndex: Int, commentAllow: Bool, passwordText: String)
}
class PublishSettingViewController: UIViewController {
    
    var publishSettingFormModel: [PublishSettingFormModel] = []
    weak var delegate: PublishSettingViewDelgate?
    var isExtended: Bool = false
    var selectedIndex: Int = 0
    
    lazy var contentView: PublishSettingView = {
        let contentView = PublishSettingView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.postingSelectorCellHeaderView.delegate = self
        contentView.postingSelectorCellView.delegate = self
        contentView.backgroundColor = .white
        contentView.setPublishSettingFormModel(publishSettingFormModel: self.publishSettingFormModel)
        contentView.topView.previousButton.addTarget(self, action: #selector(previousButtonDidTapped), for: .touchUpInside)
        view.addSubview(contentView)
        return contentView
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
        contentView.postingSelectorCellView.setUI(index: selectedIndex, data: nil, hasAdditionalDate: isExtended)
        
    }
    
    private func setConstraints() {
        view.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
    
    func setPublishSettingFormModel(publishSettingFormModel: [PublishSettingFormModel]) {
        self.publishSettingFormModel = publishSettingFormModel
    }
    
    @objc func previousButtonDidTapped(button: UIButton) {
//        delegate?.publishSettingViewControllerDismiss(self, writeTitleText: <#T##String#>, publishTag: <#T##String#>, categoryName: <#T##String#>, publishSettingIndex: <#T##Int#>, publishDateIndex: <#T##Int#>, commentAllow: <#T##Bool#>, passwordText: <#T##String#>)
    }
}

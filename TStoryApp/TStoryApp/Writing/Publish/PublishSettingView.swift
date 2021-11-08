//
//  PublishingSettingView1.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/05.
//

import UIKit

class PublishSettingView: UIView {
    
    var publishSettingFormModel: [PublishSettingFormModel] = []
    
    lazy var topView: PublishSettingTopView = {
        let topView = PublishSettingTopView()
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = .white
        addSubview(topView)
        return topView
    } ()
    
    lazy var headerView: PublishSettingHeaderView = {
        let header = PublishSettingHeaderView()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.setTitleTextFieldText(title: publishSettingFormModel[0].publishCategoryName)
        header.setPublishTagText(tag: publishSettingFormModel[0].publishTagText)
        header.setCategorySelectionButtonText(name: publishSettingFormModel[0].publishCategoryName)
        addSubview(header)
        return header
    } ()
    
    lazy var postingSelectorCellHeaderView: PublishSettingCellHeaderView = {
        let postingSelectorCellHeaderView = PublishSettingCellHeaderView()
        postingSelectorCellHeaderView.translatesAutoresizingMaskIntoConstraints = false
        postingSelectorCellHeaderView.setPublishSettingIndex(index: publishSettingFormModel[0].publishSettingIndex)
        addSubview(postingSelectorCellHeaderView)
        return postingSelectorCellHeaderView
    } ()
    
    lazy var postingSelectorCellView: PublishSettingCellContentView = {
        let postingSelectorCellView = PublishSettingCellContentView()
        postingSelectorCellView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(postingSelectorCellView)
        return postingSelectorCellView
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            topView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            topView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        let seperator = UIView()
        seperator.translatesAutoresizingMaskIntoConstraints = false
        seperator.backgroundColor = .lightGray.withAlphaComponent(0.5)
        addSubview(seperator)
        
        NSLayoutConstraint.activate([
            seperator.leadingAnchor.constraint(equalTo: leadingAnchor),
            seperator.trailingAnchor.constraint(equalTo: trailingAnchor),
            seperator.topAnchor.constraint(equalTo: topView.bottomAnchor),
            seperator.heightAnchor.constraint(equalToConstant: 0.5)
        ])
        
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerView.topAnchor.constraint(equalTo: seperator.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            postingSelectorCellHeaderView.leadingAnchor.constraint(equalTo: leadingAnchor),
            postingSelectorCellHeaderView.trailingAnchor.constraint(equalTo: trailingAnchor),
            postingSelectorCellHeaderView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            postingSelectorCellHeaderView.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        NSLayoutConstraint.activate([
            postingSelectorCellView.leadingAnchor.constraint(equalTo: leadingAnchor),
            postingSelectorCellView.trailingAnchor.constraint(equalTo: trailingAnchor),
            postingSelectorCellView.topAnchor.constraint(equalTo: postingSelectorCellHeaderView.bottomAnchor),
            postingSelectorCellView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setPublishSettingFormModel(publishSettingFormModel: [PublishSettingFormModel]){
        self.publishSettingFormModel = publishSettingFormModel
    }
}

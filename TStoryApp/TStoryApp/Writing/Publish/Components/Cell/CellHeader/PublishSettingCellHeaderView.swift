//
//  PublishingSettingCellHeaderView.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/05.
//

import UIKit

protocol PublishSettingCellHeaderViewDelegate: AnyObject {
    func segmentControlDidTapped(index: Int)
}

class PublishSettingCellHeaderView: UIView {
    weak var delegate: PublishSettingCellHeaderViewDelegate?
    var publishSettingIndex: Int = 0
    
    private lazy var topSeperator: UIView = {
        let topSeperator = UIView()
        topSeperator.translatesAutoresizingMaskIntoConstraints = false
        topSeperator.backgroundColor = .lightGray.withAlphaComponent(0.5)
        addSubview(topSeperator)
        return topSeperator
    } ()
    
    private lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "공개 설정"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .light)
        addSubview(label)
        return label
    } ()
    
    private lazy var publicSelectorView: PublishSettingHeaderComponent = {
        let component = PublishSettingHeaderComponent(text: "공개", tag: 0)
        component.translatesAutoresizingMaskIntoConstraints = false
        let gesture = UITapGestureRecognizer(target: self, action: #selector(selectorDidTapped))
        component.addGestureRecognizer(gesture)
        addSubview(component)
        return component
    } ()
    
    private lazy var protectSelectorView: PublishSettingHeaderComponent = {
        let component = PublishSettingHeaderComponent(text: "보호", tag: 1)
        component.translatesAutoresizingMaskIntoConstraints = false
        let gesture = UITapGestureRecognizer(target: self, action: #selector(selectorDidTapped))
        component.addGestureRecognizer(gesture)
        addSubview(component)
        return component
    } ()
    
    private lazy var privateSelectorView: PublishSettingHeaderComponent = {
        let component = PublishSettingHeaderComponent(text: "비공개", tag: 2)
        component.translatesAutoresizingMaskIntoConstraints = false
        let gesture = UITapGestureRecognizer(target: self, action: #selector(selectorDidTapped))
        component.addGestureRecognizer(gesture)
        addSubview(component)
        return component
    } ()
    
    private lazy var bottomSeperator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        addSubview(view)
        return view
    } ()
    
    var selectedTab: PublishSettingHeaderComponent?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            publicSelectorView.leadingAnchor.constraint(greaterThanOrEqualTo: titleLabel.trailingAnchor, constant: 10),
            publicSelectorView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            protectSelectorView.leadingAnchor.constraint(equalTo: publicSelectorView.trailingAnchor, constant: 40),
            protectSelectorView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            privateSelectorView.leadingAnchor.constraint(equalTo: protectSelectorView.trailingAnchor, constant: 40),
            privateSelectorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            privateSelectorView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            bottomSeperator.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomSeperator.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomSeperator.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomSeperator.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    @objc private func selectorDidTapped(gesture: UITapGestureRecognizer) {
        guard let tag = gesture.view?.tag else { return }
        delegate?.segmentControlDidTapped(index: tag)
        setPublishSettingIndex(index: tag)
    }
    
    private func initializeSelector() {
        publicSelectorView.setUI(isSelected: false)
        privateSelectorView.setUI(isSelected: false)
        protectSelectorView.setUI(isSelected: false)
    }
    
    func setPublishSettingIndex(index: Int) {
        self.publishSettingIndex = index
        initializeSelector()
        
        if index == 0 {
            selectedTab = publicSelectorView
        }
        else if index == 1 {
            selectedTab = protectSelectorView
        }
        else {
            selectedTab = privateSelectorView
        }
        
        selectedTab?.setUI(isSelected: true)
    }
    
    func getPublishSettingIndex() -> Int {
        return publishSettingIndex
    }
    
}


class PublishSettingHeaderComponent: UIView {
    private var text: String?
    private lazy var topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        addSubview(view)
        return view
    } ()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.font = .systemFont(ofSize: 14)
        addSubview(label)
        return label
    } ()
    
    init(text: String, tag: Int) {
        self.text = text
        super.init(frame: .zero)
        setConstraints()
        self.tag = tag
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setUI(isSelected: Bool) {
        topView.backgroundColor = isSelected ? .black : .lightGray
        textLabel.font = UIFont.systemFont(ofSize: 14, weight: isSelected ? .bold : .regular)
        textLabel.textColor = isSelected ? .black : .lightGray
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            topView.centerXAnchor.constraint(equalTo: centerXAnchor),
            topView.topAnchor.constraint(equalTo: topAnchor),
            topView.widthAnchor.constraint(equalToConstant: 20),
            topView.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            textLabel.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 10),
            textLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

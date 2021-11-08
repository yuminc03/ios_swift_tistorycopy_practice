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
    
    lazy var publicSelectorView: UIView = {
        let publicSelectorView = UIView()
        publicSelectorView.translatesAutoresizingMaskIntoConstraints = false
        publicSelectorView.backgroundColor = .lightGray
        publicSelectorView.layer.cornerRadius = 10
        publicSelectorView.tag = 0
        publicSelectorView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(selectorDidTapped))
        publicSelectorView.addGestureRecognizer(gesture)
        addSubview(publicSelectorView)
        return publicSelectorView
    } ()
    
    lazy var publicSelectorLabel: UILabel = {
        let publicSelectorLabel = UILabel()
        publicSelectorLabel.translatesAutoresizingMaskIntoConstraints = false
        publicSelectorLabel.text = "공개"
        publicSelectorLabel.textColor = .lightGray
        publicSelectorLabel.font = .systemFont(ofSize: 14, weight: .light)
        publicSelectorLabel.tag = 0
        publicSelectorLabel.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(selectorDidTapped))
        publicSelectorLabel.addGestureRecognizer(gesture)
        addSubview(publicSelectorLabel)
        return publicSelectorLabel
    } ()
    
    lazy var protectSelectorView: UIView = {
        let protectSelectorView = UIView()
        protectSelectorView.translatesAutoresizingMaskIntoConstraints = false
        protectSelectorView.backgroundColor = .lightGray
        protectSelectorView.layer.cornerRadius = 10
        protectSelectorView.tag = 1
        protectSelectorView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(selectorDidTapped))
        protectSelectorView.addGestureRecognizer(gesture)
        addSubview(protectSelectorView)
        return protectSelectorView
    } ()
    
    lazy var protectSelectorLabel: UILabel = {
        let protectSelectorLabel = UILabel()
        protectSelectorLabel.translatesAutoresizingMaskIntoConstraints = false
        protectSelectorLabel.text = "보호"
        protectSelectorLabel.textColor = .lightGray
        protectSelectorLabel.font = .systemFont(ofSize: 14, weight: .light)
        protectSelectorLabel.tag = 1
        protectSelectorLabel.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(selectorDidTapped))
        protectSelectorLabel.addGestureRecognizer(gesture)
        addSubview(protectSelectorLabel)
        return protectSelectorLabel
    } ()
    
    lazy var privateSelectorView: UIView = {
        let privateSelectorView = UIView()
        privateSelectorView.translatesAutoresizingMaskIntoConstraints = false
        privateSelectorView.backgroundColor = .lightGray
        privateSelectorView.layer.cornerRadius = 10
        privateSelectorView.tag = 2
        privateSelectorView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(selectorDidTapped))
        privateSelectorView.addGestureRecognizer(gesture)
        addSubview(privateSelectorView)
        return privateSelectorView
    } ()
    
    lazy var privateSelectorLabel: UILabel = {
        let privateSelectorLabel = UILabel()
        privateSelectorLabel.translatesAutoresizingMaskIntoConstraints = false
        privateSelectorLabel.text = "비공개"
        privateSelectorLabel.textColor = .lightGray
        privateSelectorLabel.font = .systemFont(ofSize: 14, weight: .light)
        privateSelectorLabel.tag = 2
        privateSelectorLabel.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(selectorDidTapped))
        privateSelectorLabel.addGestureRecognizer(gesture)
        addSubview(privateSelectorLabel)
        return privateSelectorLabel
    } ()
    
    private lazy var bottomSeperator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        addSubview(view)
        return view
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
        publishSettingViewColor(index: publishSettingIndex, isSelected: true)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            topSeperator.leadingAnchor.constraint(equalTo: leadingAnchor),
            topSeperator.trailingAnchor.constraint(equalTo: trailingAnchor),
            topSeperator.topAnchor.constraint(equalTo: topAnchor),
            topSeperator.heightAnchor.constraint(equalToConstant: 10)
        ])
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            publicSelectorView.leadingAnchor.constraint(greaterThanOrEqualTo: titleLabel.trailingAnchor, constant: 10),
            publicSelectorView.trailingAnchor.constraint(equalTo: protectSelectorView.leadingAnchor, constant: -40),
//            publicSelectorView.topAnchor.constraint(equalTo: topSeperator.bottomAnchor, constant: 20),
//            publicSelectorView.bottomAnchor.constraint(equalTo: bottomSeperator.topAnchor, constant: -20),
            publicSelectorView.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            publicSelectorView.widthAnchor.constraint(equalToConstant: 20),
            publicSelectorView.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            publicSelectorLabel.centerXAnchor.constraint(equalTo: publicSelectorView.centerXAnchor),
            publicSelectorLabel.topAnchor.constraint(equalTo: publicSelectorView.bottomAnchor, constant: 5)
        ])
        
        NSLayoutConstraint.activate([
            protectSelectorView.trailingAnchor.constraint(equalTo: privateSelectorView.leadingAnchor, constant: -40),
            protectSelectorView.centerYAnchor.constraint(equalTo: publicSelectorView.centerYAnchor),
            protectSelectorView.widthAnchor.constraint(equalToConstant: 20),
            protectSelectorView.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            protectSelectorLabel.centerXAnchor.constraint(equalTo: protectSelectorView.centerXAnchor),
            protectSelectorLabel.topAnchor.constraint(equalTo: protectSelectorView.bottomAnchor, constant: 5)
        ])
        
        NSLayoutConstraint.activate([
            privateSelectorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            privateSelectorView.centerYAnchor.constraint(equalTo: publicSelectorView.centerYAnchor),
            privateSelectorView.widthAnchor.constraint(equalToConstant: 20),
            privateSelectorView.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            privateSelectorLabel.centerXAnchor.constraint(equalTo: privateSelectorView.centerXAnchor),
            privateSelectorLabel.topAnchor.constraint(equalTo: privateSelectorView.bottomAnchor, constant: 5)
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
        
        publishSettingViewColor(index: publishSettingIndex, isSelected: false)
        publishSettingViewColor(index: tag, isSelected: true)
        publishSettingIndex = tag
        setPublishSettingIndex(index: publishSettingIndex)
    }
    
    func publishSettingViewColor(index: Int, isSelected: Bool) {
        if let views = self.subviews[index + 3] as? UIView {
            views.backgroundColor = isSelected ? .black : .lightGray
        }
        if let label = self.subviews[index + 3] as? UILabel {
            label.textColor = isSelected ? .black : .lightGray
            label.font = .systemFont(ofSize: 14, weight: isSelected ? .bold : .light)
        }
    }
    
    func setPublishSettingIndex(index: Int) {
        self.publishSettingIndex = index
    }
    
}

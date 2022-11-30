//
//  BlogImageSettingCategoryViewController.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2022/05/18.
//

import UIKit

protocol BlogImageSettingCategoryViewControllerDelegate: AnyObject {
    
    func stackViewBlockDidTapped(tag: Int?, controller: UIViewController?)
    func backgroundDidTapped(controller: UIViewController?)
}
class BlogImageSettingCategoryViewController: UIViewController {
    
    let containerView = UIView()
    let stackView = UIStackView()
    weak var delegate: BlogImageSettingCategoryViewControllerDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
        setupStackView()
    }
    
    private func setupView() {
        
        view.backgroundColor = .black.withAlphaComponent(0.3)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 10
        containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.addSubview(containerView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        containerView.addSubview(stackView)
    
        let bgGesture = UITapGestureRecognizer(target: self, action: #selector(backgroundDidTapped))
        view.addGestureRecognizer(bgGesture)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 15),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -30)
        ])
    }
    
    func setupStackView() {
        
        let blockTextArr = ["앨범에서 선택 및 사진 촬영", "이미지 삭제"]
        for i in 0 ..< blockTextArr.count {
            
            let blockView = BlogImageCategoryView(text: blockTextArr[i])
            blockView.translatesAutoresizingMaskIntoConstraints = false
            blockView.backgroundColor = .white
            stackView.addArrangedSubview(blockView)
            blockView.tag = i
            blockView.heightAnchor.constraint(equalToConstant: 60).isActive = true
            blockView.separator.isHidden = blockView.tag == blockTextArr.count - 1
            let gesture = UITapGestureRecognizer(target: self, action: #selector(blockViewDidTapped))
            blockView.addGestureRecognizer(gesture)
        }
        
    }
    
    @objc private func blockViewDidTapped(gesture: UITapGestureRecognizer) {
        
        if delegate != nil {
            
            delegate?.stackViewBlockDidTapped(tag: gesture.view?.tag, controller: self)
        }
    }
    
    @objc private func backgroundDidTapped(gesture: UITapGestureRecognizer) {
        
        let locations = gesture.location(in: self.view)
        if containerView.frame.contains(locations) {
            
            return
        }
        else {
            
            if delegate != nil {
                
                delegate?.backgroundDidTapped(controller: self)
            }
        }
    }
}

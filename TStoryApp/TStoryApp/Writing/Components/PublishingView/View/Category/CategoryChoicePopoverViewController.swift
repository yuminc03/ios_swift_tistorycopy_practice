//
//  CategoryChoicePopoverViewController.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/02.
//

import UIKit

protocol CategoryChoicePopoverViewControllerDelegate: AnyObject {
    func categoryDidTapped(_ viewController: CategoryChoicePopoverViewController, name: String?)
}
class CategoryChoicePopoverViewController: UIViewController {
    
    var writeFormModel : [WriteFormModel] = []
    weak var delegate: CategoryChoicePopoverViewControllerDelegate?
    
    lazy var categoryChoicePopoverView: CategoryChoicePopoverView = {
        let categoryView = CategoryChoicePopoverView()
        categoryView.translatesAutoresizingMaskIntoConstraints = false
        categoryView.backgroundColor = .white
        categoryView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        categoryView.layer.cornerRadius = 20
        
        categoryView.setPublishCategoryName(publishCategoryName: writeFormModel[0].publishSettingForm[0].publishCategoryName)
        categoryView.setCategoryChoiceStackView()
        categoryView.delegate = self
        view.addSubview(categoryView)
        return categoryView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
    }
    
    func setConstraints() {
        view.backgroundColor = .black.withAlphaComponent(0.2)
        let backgroundGesture = UITapGestureRecognizer(target: self, action: #selector(backgroundDidTapped))
        view.addGestureRecognizer(backgroundGesture)
        
        NSLayoutConstraint.activate([
            categoryChoicePopoverView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoryChoicePopoverView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoryChoicePopoverView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setWriteFormData(writeFormModel: [WriteFormModel]) {
        self.writeFormModel = writeFormModel
    }
    
    func setCategoryText(text: String) {
        self.writeFormModel[0].publishSettingForm[0].publishCategoryName = text
    }
    
    @objc func backgroundDidTapped(gesture: UITapGestureRecognizer) {
//        print("tapped!")
        let locations = gesture.location(in: self.view)
        if categoryChoicePopoverView.frame.contains(locations) {
            return
        }
        else {
            delegate?.categoryDidTapped(self, name: nil)
        }
    }
}

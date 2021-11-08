//
//  CategoryKindViewController.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/10/28.
//

import UIKit

protocol CategoryKindViewControllerDelegate: AnyObject {
    func categoryDidTapped(_ viewController: CategoryKindViewController, at: Int?)
}
class CategoryKindViewController: UIViewController {
    
    var categories: [NoticeCategory] = []
    weak var delegate: CategoryKindViewControllerDelegate?
    
    lazy var categoryView: CategoryKindView = {
        let category = CategoryKindView()
        category.translatesAutoresizingMaskIntoConstraints = false
        category.backgroundColor = .white
        category.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        category.layer.cornerRadius = 10
        category.setCategory(categories: self.categories)
        category.setStackView()
        category.delegate = self
        view.addSubview(category)
        return category
    } ()
    
    init(categories: [NoticeCategory]) {
        self.categories = categories
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(feedBackgroundDidTapped))
        view.addGestureRecognizer(gesture)
        view.backgroundColor = .black.withAlphaComponent(0.1)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            categoryView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoryView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoryView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
    
    @objc func feedBackgroundDidTapped(gesture: UITapGestureRecognizer) {
        let location = gesture.location(in: self.view)
        if categoryView.frame.contains(location){
            return
        }
        else {
            delegate?.categoryDidTapped(self, at: nil)
        }
    }
}

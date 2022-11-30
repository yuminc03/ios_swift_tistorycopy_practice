//
//  CategoryKindView.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/10/27.
//

import UIKit

protocol CategoryKindPopoverViewControllerDelegate: AnyObject {
    func categoryDidTapped(_ viewController: CategoryKindPopoverViewController, at: Int?)
}

class CategoryKindPopoverViewController: UIViewController {
    
//    let categoryKindView = CategoryView()
    var categories: [ProfileCategory] = []
    weak var delegate: CategoryKindPopoverViewControllerDelegate?
    
    lazy var categoryKindView: CategoryView = {
        let categoryView = CategoryView()
        categoryView.translatesAutoresizingMaskIntoConstraints = false
        categoryView.getCategory(categories: self.categories)
        categoryView.setStackView()
        categoryView.delegate = self
        view.addSubview(categoryView)
        return categoryView
    } ()
    
    init(categories: [ProfileCategory]) {
        self.categories = categories
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(backgroundDidTapped))
        view.addGestureRecognizer(gesture)
        view.backgroundColor = .black.withAlphaComponent(0.8)
//        view.addSubview(categoryKindView)
        
        setConstraints()
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            categoryKindView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoryKindView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoryKindView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            categoryKindView.heightAnchor.constraint(equalToConstant: 600)
        ])
        
    }
    
    @objc private func backgroundDidTapped(gesture: UITapGestureRecognizer) {
        let location = gesture.location(in: self.view)
        if categoryKindView.frame.contains(location) {
            return
        }
        else {
            delegate?.categoryDidTapped(self, at: nil)//at을 사용하지 않는다
        }
    }
    
}

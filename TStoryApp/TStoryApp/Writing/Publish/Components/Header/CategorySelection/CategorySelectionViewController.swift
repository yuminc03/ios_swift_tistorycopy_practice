//
//  CategorySelectionViewController.swift
//  TStoryApp
//
//  Created by Chu Yu Min on 2021/11/07.
//

import UIKit

protocol CategorySelectionViewControllerDelegate: AnyObject {
    func categorySelectionDidTapped(_ viewController: CategorySelectionViewController, name: String?)
}
class CategorySelectionViewController: UIViewController {
    
    var publishCategoryName: String = ""
    weak var delegate: CategorySelectionViewControllerDelegate?
    
    lazy var categorySelectionView: CategorySelectionView = {
        let categoryView = CategorySelectionView()
        categoryView.translatesAutoresizingMaskIntoConstraints = false
        categoryView.backgroundColor = .white
        categoryView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        categoryView.layer.cornerRadius = 20
        categoryView.setCategoryName(name: publishCategoryName)
        categoryView.setCategoryStackView()
        categoryView.delegate = self
        view.addSubview(categoryView)
        return categoryView
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
    }
    
    private func setConstraints() {
        view.backgroundColor = .black.withAlphaComponent(0.2)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(backgroundDidTapped))
        view.addGestureRecognizer(gesture)
        
        NSLayoutConstraint.activate([
            categorySelectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categorySelectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categorySelectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setCategoryName(name: String) {
        self.publishCategoryName = name
    }
    
    @objc func backgroundDidTapped(gesture: UITapGestureRecognizer) {
        print("tapped")
        let locations = gesture.location(in: self.view)
        if categorySelectionView.frame.contains(locations){
            return
        }
        else {
            delegate?.categorySelectionDidTapped(self, name: nil)
        }
    }
}

//
//  MyBlogOfProfileView.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/17.
//

import UIKit

protocol MyBlogOfProfileViewControllerDelegate: AnyObject {
    func profileStackViewDidTapped(viewController: MyBlogOfProfileViewController, at: Int?)
}
class MyBlogOfProfileViewController: UIViewController {
    
    var myBlogOfProfileModel = MyBlogOfProfileModel()
    weak var delegate: MyBlogOfProfileViewControllerDelegate?
    
    lazy var myBlogOfProfileView: MyBlogOfProfileView = {
        let blogOfProfileView = MyBlogOfProfileView()
        blogOfProfileView.translatesAutoresizingMaskIntoConstraints = false
        blogOfProfileView.backgroundColor = .white
        blogOfProfileView.layer.cornerRadius = 10
        blogOfProfileView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        blogOfProfileView.setMyBlogOfProfileModel(model: self.myBlogOfProfileModel)
        blogOfProfileView.setStackView()
        blogOfProfileView.delegate = self
        view.addSubview(blogOfProfileView)
        return blogOfProfileView
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstriants()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(myBlogOfProfileModel: MyBlogOfProfileModel) {
        self.myBlogOfProfileModel = myBlogOfProfileModel
        super.init(nibName: nil, bundle: nil)
    }
    
    private func setConstriants() {
        NSLayoutConstraint.activate([
            myBlogOfProfileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myBlogOfProfileView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            myBlogOfProfileView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        view.backgroundColor = .black.withAlphaComponent(0.3)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(backgroundDidTapped))
        view.addGestureRecognizer(gesture)
    }
    
    @objc private func backgroundDidTapped(gesture: UITapGestureRecognizer) {
        let locations = gesture.location(in: self.view)
        if myBlogOfProfileView.frame.contains(locations) {
            return
        }
        else {
            delegate?.profileStackViewDidTapped(viewController: self, at: nil)
        }
    }
}

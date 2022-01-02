//
//  PostContentsTagSettingViewController.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/03.
//

import UIKit
protocol PostContentsTagSettingViewControllerDelegate: AnyObject {
    func postContentsTagSettingViewControllerDismiss(_ viewController: PostContentsTagSettingViewController, text: String?)
    func postContentsTagSettingViewControllerDismissCompletion(_ viewController: PostContentsTagSettingViewController, text: String?)
}
class PostContentsTagSettingViewController: UIViewController {
    
    var writeFormModel : [WriteFormModel] = []
    weak var delegate: PostContentsTagSettingViewControllerDelegate?
    
    lazy var postContentsTagSettingView: PostContentsTagSettingView = {
        let postContentsTagSettingView = PostContentsTagSettingView()
        postContentsTagSettingView.translatesAutoresizingMaskIntoConstraints = false
        postContentsTagSettingView.backgroundColor = .white
        
        let postContentsTagSettingBackViewGesture = UITapGestureRecognizer(target: self, action: #selector(tagSettingBackViewDidTapped))
        postContentsTagSettingView.tagSettingHeaderView.tagSettingBackView.addGestureRecognizer(postContentsTagSettingBackViewGesture)
        let postContentsTagSettingCompletionGesture = UITapGestureRecognizer(target: self, action: #selector(tagSettingCompletionButtonDidTapped))
        postContentsTagSettingView.tagSettingHeaderView.tagSettingCompletionButton.addGestureRecognizer(postContentsTagSettingCompletionGesture)
        
        postContentsTagSettingView.setWriteFormModel(writeFormModel: self.writeFormModel)
        postContentsTagSettingView.setTagInputTextPlaceHolder(writeFormModel: self.writeFormModel)
        view.addSubview(postContentsTagSettingView)
        return postContentsTagSettingView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
    }
    
    private func setConstraints() {
        view.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            postContentsTagSettingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postContentsTagSettingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            postContentsTagSettingView.topAnchor.constraint(equalTo: view.topAnchor),
            postContentsTagSettingView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setWriteFormModel(writeFormModel: [WriteFormModel]) {
        self.writeFormModel = writeFormModel
    }

    
    @objc func tagSettingBackViewDidTapped(gesture: UITapGestureRecognizer) {
//        print("tapped!")
        delegate?.postContentsTagSettingViewControllerDismiss(self, text: "terminated")
        
    }
    
    @objc func tagSettingCompletionButtonDidTapped(gesture: UITapGestureRecognizer) {
//        print("tapped!")
        let tag = postContentsTagSettingView.getTagInputTextFieldText()
        delegate?.postContentsTagSettingViewControllerDismissCompletion(self, text: tag)
    }
}

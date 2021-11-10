//
//  ContentTagInputController.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/08.
//

import UIKit

protocol ContentTagInputViewControllerDelegate: AnyObject {
    func contentTagInputViewControllerDismiss(_ viewController: ContentTagInputViewController, text: String?)
    func contentTagINputViewControllerComplete(_ viewController: ContentTagInputViewController, text: String?)
}
class ContentTagInputViewController: UIViewController {
    
    var publishTag: String = ""
    let tagInputTextPlaceHolder: String = "#태그입력"
    weak var delegate: ContentTagInputViewControllerDelegate?
    
    lazy var tagInputView: ContentTagInputView = {
        let tagInputView = ContentTagInputView()
        tagInputView.translatesAutoresizingMaskIntoConstraints = false
        tagInputView.backgroundColor = .white
        tagInputView.setTagInputTextPlaceHolder(text: tagInputTextPlaceHolder)
        tagInputView.tagInputHeaderView.tagInputExitButton.addTarget(self, action: #selector(tagInputExitButtonDidTapped), for: .touchUpInside)
        view.addSubview(tagInputView)
        tagInputView.tagInputHeaderView.tagInputCompletionButton.addTarget(self, action: #selector(tagInputCompletionButtonDidTapped), for: .touchUpInside)
        return tagInputView
    } ()
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
    }
    
    private func setConstraints() {
        view.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            tagInputView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tagInputView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tagInputView.topAnchor.constraint(equalTo: view.topAnchor),
            tagInputView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setPublishTag(tag: String) {
        self.publishTag = tag
    }
    
    @objc func tagInputExitButtonDidTapped(button: UIButton) {
//        print("tapped")
        delegate?.contentTagInputViewControllerDismiss(self, text: "terminated")
    }
    
    @objc func tagInputCompletionButtonDidTapped(button: UIButton) {
//        print("tapped")
        let tag = tagInputView.getTagInputTextField()
        delegate?.contentTagINputViewControllerComplete(self, text: tag)
    }
}

//
//  PublishingSettingViewControllerExtension.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/02.
//

import UIKit

extension PublishingSettingViewController: CategoryChoicePopoverViewControllerDelegate {
    
    func categoryDidTapped(_ viewController: CategoryChoicePopoverViewController, name: String?) {
        tabBarController?.tabBar.isHidden = false
        viewController.dismiss(animated: true)
        guard let name = name else { return }
        categoryText = name
        writeFormModel[0].publishSettingForm[0].publishCategoryName = name
        publishingView.categoryView.setCategoryNameButtonText(text: name)
    }
    
}

extension PublishingSettingViewController: PostContentsTagSettingViewControllerDelegate {
    
    func postContentsTagSettingViewControllerDismissCompletion(_ viewController: PostContentsTagSettingViewController, text: String?) {
        viewController.dismiss(animated: true)
        guard let tag = text else { return }
        setPublishTagText(tag: tag)
        setPostTagLabelText(tag: tag)
    }
    
    func postContentsTagSettingViewControllerDismiss(_ viewController: PostContentsTagSettingViewController, text: String?) {
        viewController.dismiss(animated: true, completion: nil)

    }
}


//
//  PublishingSettingViewcontroller1Extensions.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/05.
//

import UIKit

extension PublishSettingViewController: PublishSettingCellHeaderViewDelegate {
    func segmentControlDidTapped(index: Int) {
        selectedIndex = index
        isExtended = false
        contentView.postingSelectorCellView.setUI(index: selectedIndex, data: homeSubject, hasAdditionalDate: isExtended)
    }
}

extension PublishSettingViewController: ContentTagInputViewControllerDelegate {
    func contentTagInputViewControllerDismiss(_ viewController: ContentTagInputViewController, text: String?) {
        viewController.dismiss(animated: true, completion: nil)
    }
    
    func contentTagINputViewControllerComplete(_ viewController: ContentTagInputViewController, text: String?) {
        viewController.dismiss(animated: true)
        guard let tag = text else { return }
        setPublishTagText(tag: tag)
        contentView.headerView.setPublishTagText(tag: tag)
    }
    
}

extension PublishSettingViewController: CategorySelectionViewControllerDelegate {
    func categorySelectionDidTapped(_ viewController: CategorySelectionViewController, name: String?) {
        tabBarController?.tabBar.isHidden = false
        viewController.dismiss(animated: true)
        guard let name = name else { return }
        writeFormModel.publishSettingForm[0].publishCategoryName = name
        contentView.headerView.setCategorySelectionButtonText(name: name)
    }

}

//extension PublishSettingViewController: PublishSettingCellContentViewDelegate {
//    func extendableButtonToggle() {
//        isExtended = !isExtended
//        contentView.postingSelectorCellView.setUI(index: selectedIndex, data: nil, hasAdditionalHome: isExtended)
//    }
//}

extension PublishSettingViewController: PublishSettingCellContentViewDelegate {
    func currentDateLabelDidTapped() {
        contentView.postingSelectorCellView.setUI(index: selectedIndex, data: homeSubject, hasAdditionalDate: false)
    }
    
    func reservationDateLabelDidTapped() {
        contentView.postingSelectorCellView.setUI(index: selectedIndex, data: "", hasAdditionalDate: true)
    }
}

extension PublishSettingViewController: HomeSubjectSelectorViewControllerDelegate {
    func homeSubjectSelectorDidTapped(_ viewController: HomeSubjectSelectorViewController, subjectName: String?) {
        viewController.dismiss(animated: true)
        guard let name = subjectName else { return }
        homeSubject = name
        contentView.postingSelectorCellView.homeSubjectView.setHomeSubject(subjectText: name)
        contentView.postingSelectorCellView.setUI(index: selectedIndex, data: homeSubject, hasAdditionalDate: isExtended)
    }
    
}

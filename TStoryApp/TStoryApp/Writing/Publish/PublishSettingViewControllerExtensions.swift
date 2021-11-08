//
//  PublishingSettingViewcontroller1Extensions.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/05.
//

import Foundation

extension PublishSettingViewController: PublishSettingCellHeaderViewDelegate {
    func segmentControlDidTapped(index: Int) {
        selectedIndex = index
        isExtended = false
        contentView.postingSelectorCellView.setUI(index: selectedIndex, data: nil, hasAdditionalDate: false)
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
        contentView.postingSelectorCellView.setUI(index: selectedIndex, data: nil, hasAdditionalDate: false)
    }
    
    func reservationDateLabelDidTapped() {
        contentView.postingSelectorCellView.setUI(index: selectedIndex, data: nil, hasAdditionalDate: true)
    }
}

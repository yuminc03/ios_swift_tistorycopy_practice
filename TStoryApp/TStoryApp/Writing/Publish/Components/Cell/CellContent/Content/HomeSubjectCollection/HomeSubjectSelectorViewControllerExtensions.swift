//
//  HomeSubjectSelectorViewControllerExtensions.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/09.
//

import UIKit

extension HomeSubjectSelectorViewController: HomeSubjectCollectionViewDelegate {
    func homeSubjectSelectorDidTapped(name: String?) {
        delegate?.homeSubjectSelectorDidTapped(self, subjectName: name)
    }
}

extension HomeSubjectSelectorViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 10
        return homeSubjectModel.homeSubjectHeader[section].homeSubjectCategory.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 5
        return homeSubjectModel.homeSubjectHeader.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        print(kind)
        if kind == UICollectionView.elementKindSectionHeader {
//            let title = homeSubjectModel.homeSubjectHeader[homeSubjectHeaderIndex].homeSubjectTitle
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "home_subject_header", for: indexPath) as! HomeSubjectHeaderView
            header.homeSubjectTitleLabel.text = homeSubjectModel.homeSubjectHeader[indexPath.section].homeSubjectTitle
            return header
        }
        else { assert(false, "")
            fatalError()
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = homeSubjectModel.homeSubjectHeader[indexPath.section].homeSubjectCategory[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "home_subject_cell", for: indexPath) as! HomeSubjectSelectorCell
//        cell.backgroundColor = .black.withAlphaComponent(CGFloat(indexPath.row) * 0.01)
        cell.backgroundColor = .white
        cell.layer.borderColor = data.homeSubjectName == publishSubject ? ( UIColor.red.cgColor ) : ( UIColor.lightGray.withAlphaComponent(0.5).cgColor )
        cell.homeSubjectSelectorLabel.textColor = data.homeSubjectName == publishSubject ? .red : .black
        cell.layer.borderWidth = 0.5
        cell.layer.cornerRadius = 10
        cell.setHomeSubjectSelectorCellData(data: data.homeSubjectName)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectshaItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? HomeSubjectSelectorCell else { return }
        guard let name = cell.homeSubjectSelectorLabel.text else { return }
        cell.setHomeSubjectSelectorCell(name: name)
        delegate?.homeSubjectSelectorDidTapped(self, subjectName: name)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.bounds.width, height: section == 0 ? 0 : 50) //header 크기
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.bounds.width - 60) / 2, height: 40) //cell 크기 (bounds - view의 크기)
    }
}

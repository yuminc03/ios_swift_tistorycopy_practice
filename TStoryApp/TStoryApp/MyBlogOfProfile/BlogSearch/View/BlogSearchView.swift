//
//  BlogSearchStackView.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/23.
//

import UIKit

class BlogSearchView: UIView {
    
    var blogSearchModel = BlogSearchModel()
    
    lazy var searchWordsStackViewTopLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "최근 검색어"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
        addSubview(label)
        return label
    } ()
        
    lazy var searchWordsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 0
        addSubview(stackView)
        return stackView
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setStackView() {
        for i in 0 ..< blogSearchModel.searchResultModal.count {
            let searchWordsView = BlogSearchWordsView(searchWords: blogSearchModel.searchResultModal[i].searchWords, searchDate: blogSearchModel.searchResultModal[i].searchDate)
            searchWordsView.backgroundColor = .white
            searchWordsView.tag = i
            searchWordsStackView.addArrangedSubview(searchWordsView)
            searchWordsView.heightAnchor.constraint(equalToConstant: 50).isActive = true
            searchWordsView.searchDeleteButton.addTarget(self, action: #selector(searchDeleteButtonDidTapped), for: .touchUpInside)
        }
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            searchWordsStackViewTopLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            searchWordsStackViewTopLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            searchWordsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchWordsStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            searchWordsStackView.topAnchor.constraint(equalTo: searchWordsStackViewTopLabel.bottomAnchor, constant: 10),
            searchWordsStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    @objc private func searchDeleteButtonDidTapped(button: UIButton){
        guard let views = button.superview?.tag else { return }
        if let label = searchWordsStackView.subviews[views].subviews[0] as? UILabel {
            label.text = ""
        }
        searchWordsStackView.removeArrangedSubview(button.superview!)
        blogSearchModel.searchResultModal.remove(at: views)
        //stackView reload
        for subview in searchWordsStackView.arrangedSubviews {
            searchWordsStackView.removeArrangedSubview(subview)
        }
        self.setStackView()
    }
    
    func setBlogSearchData(model: BlogSearchModel){
        self.blogSearchModel = model
    }
    
    func getBlogSearchData() -> BlogSearchModel {
        return self.blogSearchModel
    }
}

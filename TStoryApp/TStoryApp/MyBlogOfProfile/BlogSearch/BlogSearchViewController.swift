//
//  BlogSearchViewController.swift
//  TStoryApp
//
//  Created by Chu Yu Min on 2021/11/22.
//

import UIKit

protocol BlogSearchViewControllerDelegate: AnyObject {
    func dismissBlogSearchViewController(model: BlogSearchModel)
}
class BlogSearchViewController: UIViewController {
    
    var blogSearchModel = BlogSearchModel()
    weak var delegate: BlogSearchViewControllerDelegate?
    
    lazy var topView: BlogSearchTopView = {
        let topView = BlogSearchTopView()
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = .white
        topView.dismissBlogSearchButton.addTarget(self, action: #selector(dismissBlogSearchButtonDidTapped), for: .touchUpInside)
        topView.searchButton.addTarget(self, action: #selector(searchButtonDidTapped), for: .touchUpInside)
        topView.searchTextField.delegate = self
        view.addSubview(topView)
        return topView
    } ()
    
    lazy var blogSearchView: BlogSearchView = {
        let searchView = BlogSearchView()
        searchView.translatesAutoresizingMaskIntoConstraints = false
        searchView.backgroundColor = .clear
        searchView.setBlogSearchData(model: self.blogSearchModel)
        searchView.setStackView()
        view.addSubview(searchView)
        return searchView
    } ()
    
    lazy var bottomView: BlogSearchBottomView = {
        let bottomView = BlogSearchBottomView()
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.backgroundColor = .white
        view.addSubview(bottomView)
        return bottomView
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
    }
    
    init(blogSearchModel: BlogSearchModel) {
        self.blogSearchModel = blogSearchModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints(){
        view.backgroundColor = .white
        NSLayoutConstraint.activate([
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            blogSearchView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blogSearchView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blogSearchView.topAnchor.constraint(equalTo: topView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.topAnchor.constraint(equalTo: blogSearchView.bottomAnchor),
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc private func dismissBlogSearchButtonDidTapped(button: UIButton) {
        self.blogSearchModel = blogSearchView.getBlogSearchData()
        delegate?.dismissBlogSearchViewController(model: self.blogSearchModel)
        self.dismiss(animated: false, completion: nil)
    }
    
    @objc private func searchButtonDidTapped(button: UIButton) {
        let searchDate = getTodayDate()
        guard let searchWords = topView.searchTextField.text else { return }
        let searchView = BlogSearchWordsView(searchWords: searchWords, searchDate: searchDate)
        searchView.translatesAutoresizingMaskIntoConstraints = false
        searchView.backgroundColor = .white
        blogSearchView.searchWordsStackView.insertArrangedSubview(searchView, at: 0)
        searchView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        blogSearchView.blogSearchModel.searchResultModal.insert(SearchResultModel(searchWords: searchWords, searchDate: searchDate), at: 0)
    }
    
    func getTodayDate() -> String {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM. dd."
        dateFormatter.timeZone = NSTimeZone(name: "ko_KR") as TimeZone?
        return dateFormatter.string(from: now)
        
    }
    
}

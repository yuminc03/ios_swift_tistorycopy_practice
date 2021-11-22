//
//  BlogSearchViewController.swift
//  TStoryApp
//
//  Created by Chu Yu Min on 2021/11/22.
//

import UIKit

class BlogSearchViewController: UIViewController {
    
    var blogSearchModel = BlogSearchModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configulations()
        setConstraints()
    }
    
    func configulations(){
        let model = BlogSearchModel(
            searchResultModal: [
            SearchResultModel(
                searchWords: "알바천국",
                searchDate: "11. 16."
            ),
            SearchResultModel(
                searchWords: "ㄹㄹㅅㅎㄹㄱ",
                searchDate: "11. 17."
            ),
            SearchResultModel(
                searchWords: "swift",
                searchDate: "11. 22."
            )
        ])
        
        blogSearchModel = model
    }
    private func setConstraints(){
        view.backgroundColor = .white
    }
}

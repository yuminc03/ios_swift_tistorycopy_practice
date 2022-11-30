//
//  OtherContentsViewController.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/11/22.
//

import UIKit

class OtherContentsViewController: UIViewController {
    
    var viewTitle: String = ""
    
    lazy var topView: OtherContentsTopView = {
        let topView = OtherContentsTopView(title: viewTitle)
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = .white
        topView.dismissOtherContentsViewButton.addTarget(self, action: #selector(dismissOtherContentsViewButtonDidTapped), for: .touchUpInside)
        view.addSubview(topView)
        return topView
    } ()
    
    lazy var otherContentsView: OtherContentsView = {
        let otherContentsView = OtherContentsView()
        otherContentsView.translatesAutoresizingMaskIntoConstraints = false
        otherContentsView.backgroundColor = .white
        view.addSubview(otherContentsView)
        return otherContentsView
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
    }
    
    init(title: String){
        self.viewTitle = title
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
            topView.heightAnchor.constraint(equalToConstant: 150)
        ])
        NSLayoutConstraint.activate([
            otherContentsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            otherContentsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            otherContentsView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            otherContentsView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc private func dismissOtherContentsViewButtonDidTapped(button: UIButton){
        self.dismiss(animated: false, completion: nil)
    }
}

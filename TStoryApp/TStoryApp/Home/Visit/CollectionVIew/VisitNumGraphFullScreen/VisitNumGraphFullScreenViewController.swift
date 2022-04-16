//
//  VisitNumGraphFullScreenViewController.swift
//  TStoryApp
//
//  Created by yumin chu on 2021/11/25.
//

import UIKit

class VisitNumGraphFullScreenViewController: UIViewController {
    
    var visitCell = VisitCell()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .clear
        scrollView.canCancelContentTouches = true
        scrollView.delaysContentTouches = true
        view.addSubview(scrollView)
        return scrollView
    } ()
    
    lazy var topView: VisitNumGraphFullScreenTopView = {
        let topView = VisitNumGraphFullScreenTopView()
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = .white
        topView.isUserInteractionEnabled = true
        topView.dismissVisitNumGraphFullScreenButton.addTarget(self, action: #selector(dismissVisitNumGraphFullScreenButtonDidTapped), for: .touchUpInside)
        scrollView.addSubview(topView)
        return topView
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
    }
    
    init(visitCell: VisitCell){
        self.visitCell = visitCell
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints(){
        view.backgroundColor = .white
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topView.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    @objc private func dismissVisitNumGraphFullScreenButtonDidTapped(button: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

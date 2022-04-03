//
//  ProfileViewController.swift
//  TStoryApp
//
//  Created by yumin chu on 2021/10/26.
//

import UIKit


class ProfileViewController: UIViewController {
    
    var viewModel = ProfileViewModel()
    
    var navigationBarView = NavigationBarView()
    var profileTableView = ProfileTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
        viewModel.configulations()
    }
    
    //MARK: set UI
    func reloadTableView() {//category를 바꾸었을 때 호출!
        profileTableView.reloadData()
    }
    
    private func setupView() {
        
        profileTableView.translatesAutoresizingMaskIntoConstraints = false
        profileTableView.delegate = self
        profileTableView.dataSource = self
        view.addSubview(profileTableView)
        
        navigationBarView.translatesAutoresizingMaskIntoConstraints = false
        self.navigationItem.titleView = navigationBarView
        self.navigationItem.titleView?.tintColor = .clear
        navigationBarView.blogSearchButton.setTitleColor(.white, for: .normal)
        navigationBarView.blogSearchButton.addTarget(self, action: #selector(blogSearchButtonDidTapped), for: .touchUpInside)
        navigationBarView.blogProfileButton.addTarget(self, action: #selector(blogProfileButtonDidTapped), for: .touchUpInside)
        view.addSubview(navigationBarView)
    }

    private func setConstraints() {
        
        view.backgroundColor = .white
        NSLayoutConstraint.activate([
            profileTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileTableView.topAnchor.constraint(equalTo: view.topAnchor),
            profileTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            navigationBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationBarView.topAnchor.constraint(equalTo: view.topAnchor),
            navigationBarView.heightAnchor.constraint(equalToConstant: 90)
        ])
    }
    
    @objc private func blogProfileButtonDidTapped(button: UIButton) {
        tabBarController?.tabBar.isHidden = true
        let vc = MyBlogOfProfileViewController(myBlogOfProfileModel: viewModel.myBlogOfProfileModel)
        vc.delegate = self
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: false)
    }
    
    @objc private func blogSearchButtonDidTapped(button: UIButton) {
        let vc = BlogSearchViewController(blogSearchModel: viewModel.blogSearchModel)
        vc.delegate = self
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }
    
}


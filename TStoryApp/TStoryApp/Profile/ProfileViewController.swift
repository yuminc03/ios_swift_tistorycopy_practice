//
//  ProfileViewController.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/10/26.
//

import UIKit


class ProfileViewController: UIViewController {
    
    var viewModel = ProfileViewModel()
    var navigationBarView = NavigationBarView()
    var profileTableView = UITableView(frame: .zero, style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.configulations()
        setupView()
        setConstraints()
    }
    
    //MARK: set UI
    func reloadTableView() {//category를 바꾸었을 때 호출!
        profileTableView.reloadData()
    }
    
    private func setupView() {
        
        profileTableView.translatesAutoresizingMaskIntoConstraints = false
        profileTableView.delegate = self
        profileTableView.dataSource = self
        profileTableView.contentInsetAdjustmentBehavior = .never
        profileTableView.separatorStyle = .none
        profileTableView.backgroundColor = .clear
//        profileTableView.estimatedSectionHeaderHeight = 480
        profileTableView.showsVerticalScrollIndicator = false
        let profileHeader = ProfileTableHeader(model: viewModel.profileModel, frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 500))
        profileHeader.backgroundColor = .white
        profileHeader.blogSettingButton.addTarget(self, action: #selector(settingButtonDidTrapped), for: .touchUpInside)

        profileTableView.tableHeaderView = profileHeader
//        profileTableView.register(ProfileTableViewHeader.self, forHeaderFooterViewReuseIdentifier: "profile_header")
        profileTableView.register(MyContentTableViewHeader.self, forHeaderFooterViewReuseIdentifier: "my_content_header")
        profileTableView.register(MyContentTableViewCell.self, forCellReuseIdentifier: "my_contents")
        view.addSubview(profileTableView)
        
        navigationBarView.translatesAutoresizingMaskIntoConstraints = false
        navigationBarView.model = viewModel.profileModel
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
    
    @objc private func settingButtonDidTrapped(button: UIButton) {
        //print("touched")
        let vc = BlogSettingViewController()
        vc.model = viewModel.profileModel
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true)
    }
}


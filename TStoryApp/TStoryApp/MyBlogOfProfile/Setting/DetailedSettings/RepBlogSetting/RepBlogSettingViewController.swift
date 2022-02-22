//
//  RepBlogSettingViewController.swift
//  TStoryApp
//
//  Created by yumin chu on 2021/11/19.
//

import UIKit

class RepBlogSettingViewController: UIViewController {
    
    var myBlogOfProfileModel = MyBlogOfProfileModel()
    
    lazy var repBlogSettingTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(RepBlogSettingTableViewHeader.self, forHeaderFooterViewReuseIdentifier: "rep_blog_setting_header")
        tableView.register(RepBlogSettingTableViewCell.self, forCellReuseIdentifier: "rep_blog_setting_cell")
        view.addSubview(tableView)
        return tableView
    } ()
    
    init(myBlogOfProfileModel: MyBlogOfProfileModel){
        self.myBlogOfProfileModel = myBlogOfProfileModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
    }
    
    private func setConstraints(){
        view.backgroundColor = .white
        NSLayoutConstraint.activate([
            repBlogSettingTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            repBlogSettingTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            repBlogSettingTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            repBlogSettingTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    func getMyBlogOfProfileModel() -> MyBlogOfProfileModel {
        return self.myBlogOfProfileModel
    }
}

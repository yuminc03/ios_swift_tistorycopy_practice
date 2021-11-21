//
//  MyBlogOfProfileView.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/17.
//

import UIKit

protocol MyBlogOfProfileViewDelegate: AnyObject {
    func profileStackViewDidTapped(at: Int)
}
class MyBlogOfProfileView: UIView {
    
    var myBlogOfProfileModel = MyBlogOfProfileModel()
    weak var delegate: MyBlogOfProfileViewDelegate?
    
    lazy var myBlogOfProfileStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .clear
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
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            myBlogOfProfileStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            myBlogOfProfileStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            myBlogOfProfileStackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            myBlogOfProfileStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setStackView() {
        let profileInfoStackViewHeader = ProfileInfoStackViewHeader()
        profileInfoStackViewHeader.translatesAutoresizingMaskIntoConstraints = false
        profileInfoStackViewHeader.backgroundColor = .white
        profileInfoStackViewHeader.accountSettingButton.addTarget(self, action: #selector(settingButtonDidTapped), for: .touchUpInside)
        profileInfoStackViewHeader.setProfileInfoTableViewHeader(name: myBlogOfProfileModel.profileName, email: myBlogOfProfileModel.profileEmail)
        myBlogOfProfileStackView.addArrangedSubview(profileInfoStackViewHeader)
        profileInfoStackViewHeader.heightAnchor.constraint(equalToConstant: 90).isActive = true
        for i in 0 ..< self.myBlogOfProfileModel.myBlogsModel.count {
            let myBlogView = ProfileInfoStackViewCell()
            myBlogView.translatesAutoresizingMaskIntoConstraints = false
            myBlogView.backgroundColor = .white
            myBlogView.setProfileInfoTableViewCell(name: myBlogOfProfileModel.myBlogsModel[i].blogName)
            myBlogOfProfileStackView.addArrangedSubview(myBlogView)
            myBlogView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        }
        let profileInfoStackViewFooter = ProfileInfoStackViewFooter()
        profileInfoStackViewFooter.translatesAutoresizingMaskIntoConstraints = false
        profileInfoStackViewFooter.backgroundColor = .white
        profileInfoStackViewFooter.settingButton.addTarget(self, action: #selector(settingButtonDidTapped), for: .touchUpInside)
        myBlogOfProfileStackView.addArrangedSubview(profileInfoStackViewFooter)
        profileInfoStackViewFooter.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setMyBlogOfProfileModel(model: MyBlogOfProfileModel) {
        self.myBlogOfProfileModel = model
    }
    
    @objc private func settingButtonDidTapped(button: UIButton) {
//        print(button.tag)
        delegate?.profileStackViewDidTapped(at: button.tag)
    }
}

//
//  ChangeNicknameViewController.swift
//  TStoryApp
//
//  Created by yumin chu on 2021/11/19.
//

import UIKit

protocol ChangeNicknameViewControllerDelegate: AnyObject {
    func getChangeNickname(name: String)
}
class ChangeNicknameViewController: UIViewController {
    
    var myBlogOfProfileModel = MyBlogOfProfileModel()
    var isTextSame: Bool = false
    weak var delegate: ChangeNicknameViewControllerDelegate?
    
    lazy var topView: ChangeNicknameTopView = {
        let topView = ChangeNicknameTopView()
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = .white
        topView.dismissChangeNicknameButton.addTarget(self, action: #selector(dismissChangeNicknameButtonDidTapped), for: .touchUpInside)
        topView.saveChangeNicknameButton.addTarget(self, action: #selector(saveChangeNicknameButtonDidtapped), for: .touchUpInside)
        view.addSubview(topView)
        return topView
    } ()
    
    lazy var topSeparator: UIView = {
        let separator = UIView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .lightGray.withAlphaComponent(0.3)
        view.addSubview(separator)
        return separator
    } ()
    
    lazy var currentNicknameTopLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "현재 닉네임"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 12, weight: .light)
        view.addSubview(label)
        return label
    } ()
    
    lazy var currentNicknameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = myBlogOfProfileModel.profileName
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 16, weight: .light)
        view.addSubview(label)
        return label
    } ()
    
    lazy var currentNicknameBottomLine: UIView = {
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = .lightGray.withAlphaComponent(0.5)
        view.addSubview(line)
        return line
    } ()
    
    lazy var newNicknameTopLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "새 닉네임"
        label.textColor = .black
        label.font = .systemFont(ofSize: 12, weight: .light)
        view.addSubview(label)
        return label
    } ()
    
    lazy var newNicknameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 16, weight: .light)
        textField.becomeFirstResponder()
        textField.keyboardType = .webSearch
        textField.delegate = self
        view.addSubview(textField)
        return textField
    } ()
    
    lazy var newNicknameBottomLine: UIView = {
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = .black
        view.addSubview(line)
        return line
    } ()
    
    lazy var textCounterLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "\(0) / 32"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 12, weight: .light)
        view.addSubview(label)
        return label
    } ()
    
    lazy var textSameNoticeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .clear
        label.font = .systemFont(ofSize: 12, weight: .light)
        view.addSubview(label)
        return label
    } ()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
    }
    
    init(myBlogOfProfileModel: MyBlogOfProfileModel) {
        self.myBlogOfProfileModel = myBlogOfProfileModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints() {
        view.backgroundColor = .white
        NSLayoutConstraint.activate([
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            topSeparator.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topSeparator.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topSeparator.topAnchor.constraint(equalTo: topView.bottomAnchor),
            topSeparator.heightAnchor.constraint(equalToConstant: 0.5)
        ])
        
        NSLayoutConstraint.activate([
            currentNicknameTopLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            currentNicknameTopLabel.topAnchor.constraint(equalTo: topSeparator.bottomAnchor, constant: 30)
        ])
        
        NSLayoutConstraint.activate([
            currentNicknameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            currentNicknameLabel.topAnchor.constraint(equalTo: currentNicknameTopLabel.bottomAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            currentNicknameBottomLine.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            currentNicknameBottomLine.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            currentNicknameBottomLine.topAnchor.constraint(equalTo: currentNicknameLabel.bottomAnchor, constant: 10),
            currentNicknameBottomLine.heightAnchor.constraint(equalToConstant: 0.8)
        ])
        
        NSLayoutConstraint.activate([
            newNicknameTopLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            newNicknameTopLabel.topAnchor.constraint(equalTo: currentNicknameBottomLine.bottomAnchor, constant: 60)
        ])
        
        NSLayoutConstraint.activate([
            newNicknameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            newNicknameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            newNicknameTextField.topAnchor.constraint(equalTo: newNicknameTopLabel.bottomAnchor, constant: 10),
        ])
        
        NSLayoutConstraint.activate([
            newNicknameBottomLine.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            newNicknameBottomLine.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            newNicknameBottomLine.topAnchor.constraint(equalTo: newNicknameTextField.bottomAnchor, constant: 10),
            newNicknameBottomLine.heightAnchor.constraint(equalToConstant: 0.8)
        ])
        NSLayoutConstraint.activate([
            textCounterLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textCounterLabel.topAnchor.constraint(equalTo: newNicknameBottomLine.bottomAnchor, constant: 5)
        ])
        
        NSLayoutConstraint.activate([
            textSameNoticeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textSameNoticeLabel.topAnchor.constraint(equalTo: newNicknameBottomLine.bottomAnchor, constant: 5)
        ])
        
    }
    
    func newNicknameTextFieldCounter() {
        let newNickname = self.newNicknameTextField.text!.count
        self.textCounterLabel.text = "\((0) + newNickname) / 32"
        if newNicknameTextField.text == myBlogOfProfileModel.profileName {
            textFieldSetUI(isTextSame: true)
        }
        else {
            textFieldSetUI(isTextSame: false)
        }
    }
    
    func textFieldSetUI(isTextSame: Bool){
        newNicknameTopLabel.textColor = isTextSame ? .systemRed : .black
        newNicknameBottomLine.backgroundColor = isTextSame ? .systemRed : .black
        textSameNoticeLabel.text = isTextSame ? "현재 사용중인 닉네임입니다." : ""
        textSameNoticeLabel.textColor = isTextSame ? .systemRed : .black
    }
    
    @objc private func dismissChangeNicknameButtonDidTapped(button: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @objc private func saveChangeNicknameButtonDidtapped(button: UIButton) {
        if let name = newNicknameTextField.text {
            delegate?.getChangeNickname(name: name)
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    func getNewProfileName() -> String {
        return myBlogOfProfileModel.profileName
    }

}

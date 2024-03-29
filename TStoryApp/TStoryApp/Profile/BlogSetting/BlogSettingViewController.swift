//
//  BlogSettingViewController.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2022/05/18.
//

import UIKit
import Photos

protocol BlogSettingViewControllerDelegate: AnyObject {
    
    func blogSettingViewControllerDismiss(bgImage: UIImage?)
}
class BlogSettingViewController: UIViewController {
    
    let blogImageView = UIImageView()
    let imageMultiplyCover = UIView()
    let dismissButton = UIButton()
    let completionButton = UIButton()
    let blogNameDescriptionLabel = UILabel()
    let blogNameTextField = UITextField()
    let separator = UIView()
    let blogNameTextCountLabel = UILabel()
    let blogImageButton = UIButton()
    let imagePicker = UIImagePickerController()
    lazy var imagePickerService = ImagePickerService(viewController: self, imagePicker: imagePicker)
    var blogNameTextCount: Int = 0
    var model = ProfileModel()
    weak var delegate: BlogSettingViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
        viewAddGesture()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        imagePicker.delegate = self
        
        blogImageView.translatesAutoresizingMaskIntoConstraints = false
        blogImageView.backgroundColor = .black
        let bgImage = UIImage(named: model.profileImageName ?? "")
        blogImageView.image = bgImage
        blogImageView.layer.cornerRadius = 50
        blogImageView.isUserInteractionEnabled = true
        blogImageView.layer.maskedCorners = .layerMaxXMaxYCorner
        blogImageView.contentMode = .scaleAspectFill
        blogImageView.clipsToBounds = true
        view.addSubview(blogImageView)
        
        imageMultiplyCover.translatesAutoresizingMaskIntoConstraints = false
        imageMultiplyCover.backgroundColor = .black.withAlphaComponent(0.3)
        imageMultiplyCover.layer.maskedCorners = .layerMaxXMaxYCorner
        imageMultiplyCover.layer.cornerRadius = 50
        blogImageView.addSubview(imageMultiplyCover)
        
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.setTitle("✕", for: .normal)
        dismissButton.setTitleColor(.white, for: .normal)
        dismissButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .light)
        dismissButton.addTarget(self, action: #selector(dismissButtonDidTapped), for: .touchUpInside)
        dismissButton.isUserInteractionEnabled = true
        blogImageView.addSubview(dismissButton)
        
        completionButton.translatesAutoresizingMaskIntoConstraints = false
        completionButton.layer.borderColor = UIColor.white.cgColor
        completionButton.layer.borderWidth = 1
        completionButton.backgroundColor = .clear
        completionButton.setTitle("완료", for: .normal)
        completionButton.setTitleColor(.white, for: .normal)
        completionButton.layer.cornerRadius = 15
        completionButton.addTarget(self, action: #selector(dismissButtonDidTapped), for: .touchUpInside)
        blogImageView.addSubview(completionButton)
        
        blogNameDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        blogNameDescriptionLabel.text = "블로그 이름"
        blogNameDescriptionLabel.textColor = .white
        blogNameDescriptionLabel.font = .systemFont(ofSize: 12, weight: .light)
        blogImageView.addSubview(blogNameDescriptionLabel)
        
        blogNameTextField.translatesAutoresizingMaskIntoConstraints = false
        blogNameTextField.textColor = .white
        blogNameTextField.delegate = self
        blogNameTextField.text = model.profileTitle
        blogNameTextField.font = .systemFont(ofSize: 30)
        blogNameTextField.addTarget(self, action: #selector(textFieldDidChanged), for: .editingChanged)
        blogImageView.addSubview(blogNameTextField)
        
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .white
        blogImageView.addSubview(separator)
        
        blogNameTextCount = blogNameTextField.text?.count ?? 0
        blogNameTextCountLabel.translatesAutoresizingMaskIntoConstraints = false
        blogNameTextCountLabel.text = "\(blogNameTextCount) / 40"
        blogNameTextCountLabel.textColor = .white
        blogNameTextCountLabel.font = .systemFont(ofSize: 12, weight: .light)
        blogImageView.addSubview(blogNameTextCountLabel)
        
        blogImageButton.translatesAutoresizingMaskIntoConstraints = false
        blogImageButton.setTitle("📷 블로그 이미지", for: .normal)
        blogImageButton.setTitleColor(.white, for: .normal)
        blogImageButton.titleLabel?.font = .systemFont(ofSize: 12, weight: .light)
        blogImageButton.addTarget(self, action: #selector(blogImageButtonDidTapped), for: .touchUpInside)
        blogImageView.addSubview(blogImageButton)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            blogImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            blogImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            blogImageView.topAnchor.constraint(equalTo: self.view.topAnchor),
            blogImageView.heightAnchor.constraint(equalToConstant: 400)
        ])
        
        NSLayoutConstraint.activate([
            imageMultiplyCover.leadingAnchor.constraint(equalTo: blogImageView.leadingAnchor),
            imageMultiplyCover.trailingAnchor.constraint(equalTo: blogImageView.trailingAnchor),
            imageMultiplyCover.topAnchor.constraint(equalTo: blogImageView.topAnchor),
            imageMultiplyCover.bottomAnchor.constraint(equalTo: blogImageView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            dismissButton.leadingAnchor.constraint(equalTo: blogImageView.leadingAnchor, constant: 20),
            dismissButton.topAnchor.constraint(equalTo: blogImageView.safeAreaLayoutGuide.topAnchor, constant: 20),
            dismissButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            completionButton.trailingAnchor.constraint(equalTo: blogImageView.trailingAnchor, constant: -20),
            completionButton.topAnchor.constraint(equalTo: blogImageView.safeAreaLayoutGuide.topAnchor, constant: 20),
            completionButton.widthAnchor.constraint(equalToConstant: 60),
            completionButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            blogNameDescriptionLabel.leadingAnchor.constraint(equalTo: blogImageView.leadingAnchor, constant: 20),
            blogNameDescriptionLabel.bottomAnchor.constraint(equalTo: blogNameTextField.topAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            blogNameTextField.leadingAnchor.constraint(equalTo: blogImageView.leadingAnchor, constant: 20),
            blogNameTextField.trailingAnchor.constraint(equalTo: blogNameTextCountLabel.leadingAnchor, constant: -10),
            blogNameTextField.bottomAnchor.constraint(equalTo: separator.topAnchor, constant: -20),
            blogNameTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            separator.leadingAnchor.constraint(equalTo: blogImageView.leadingAnchor, constant: 20),
            separator.trailingAnchor.constraint(equalTo: blogImageView.trailingAnchor, constant: -20),
            separator.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            blogNameTextCountLabel.trailingAnchor.constraint(equalTo: blogImageView.trailingAnchor, constant: -20),
            blogNameTextCountLabel.bottomAnchor.constraint(equalTo: separator.topAnchor, constant: -10),
            blogNameTextCountLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            blogImageButton.leadingAnchor.constraint(equalTo: blogImageView.leadingAnchor, constant: 20),
            blogImageButton.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 20),
            blogImageButton.bottomAnchor.constraint(equalTo: blogImageView.bottomAnchor, constant: -20)
        ])
    }
    
    private func viewAddGesture() {
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(viewDidTapped))
        view.addGestureRecognizer(gesture)
    }
    
    @objc private func dismissButtonDidTapped() {
        self.blogImageView.image = nil
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func blogImageButtonDidTapped() {
        
        let vc = BlogImageSettingCategoryViewController()
        vc.modalPresentationStyle = .overCurrentContext
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc private func viewDidTapped(gesture: UITapGestureRecognizer) {
        
        view.endEditing(true)
    }
    
    @objc private func textFieldDidChanged(textField: UITextField) {
        
        if blogNameTextField.text?.count ?? 0 <= 40 {
            
            blogNameTextCount = blogNameTextField.text?.count ?? 0
            blogNameTextCountLabel.text = "\(blogNameTextCount) / 40"
        }
    }
}

//
//  BlogSettingViewController.swift
//  TStoryApp
//
//  Created by yumin chu on 2022/05/18.
//

import UIKit
import Photos

protocol BlogSettingViewControllerDelegate: AnyObject {
    
    func blogSettingViewControllerDismiss(bgImage: UIImage?)
}
class BlogSettingViewController: UIViewController {
    
    let blogImageView = UIImageView()
    let dismissButton = UIButton()
    let completionButton = UIButton()
    let blogNameDescriptionLabel = UILabel()
    let blogNameTextField = UITextField()
    let separator = UIView()
    let blogNameTextCountLabel = UILabel()
    let blogImageButton = UIButton()
    private let imagePicker = UIImagePickerController()
    private lazy var imagePickerService = ImagePickerService(viewController: self, imagePicker: imagePicker)
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
        blogImageView.backgroundColor = .systemBlue
        blogImageView.layer.cornerRadius = 50
        blogImageView.isUserInteractionEnabled = true
        blogImageView.layer.maskedCorners = .layerMaxXMaxYCorner
        blogImageView.contentMode = .scaleAspectFill
        blogImageView.clipsToBounds = true
        view.addSubview(blogImageView)
        
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
            blogImageView.heightAnchor.constraint(equalToConstant: 350)
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

extension BlogSettingViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        blogNameTextCount = blogNameTextField.text?.count ?? 0
        blogNameTextCountLabel.text = "\(blogNameTextCount) / 40"
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == blogNameTextField {
            guard let text = textField.text else { return true }
            let newText = (text as NSString).replacingCharacters(in: range, with: string)
            let numberOfChars = newText.count
            return numberOfChars <= 40
        }
        else {
            
            return true
        }
    }
}

extension BlogSettingViewController: BlogImageSettingCategoryViewControllerDelegate {
    
    func stackViewBlockDidTapped(tag: Int?, controller: UIViewController?) {
        
        if tag == 0 {
            
            controller?.dismiss(animated: true, completion: {

                self.imagePickerService.checkPhotoAuthStatus()
            })
        }
        else if tag == 1 {
            
            controller?.dismiss(animated: true, completion: {

                self.blogImageView.image = nil
            })
        }
    }
    
    func backgroundDidTapped(controller: UIViewController?) {
        
        controller?.dismiss(animated: true, completion: nil)
    }
    
}

extension BlogSettingViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        self.dismiss(animated: true)
        if let image = imagePickerService.getImagePickerInfo(picker: picker, info: info) {
            
            self.blogImageView.image = image
            if delegate != nil {
                
                delegate?.blogSettingViewControllerDismiss(bgImage: image)
            }
        }
    }
}

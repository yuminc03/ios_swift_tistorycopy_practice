//
//  ImageCollectionViewController.swift
//  TStoryApp
//
//  Created by yumin chu on 2022/05/18.
//

import UIKit
import Photos
import PhotosUI

class ImageCollectionViewController: UIViewController {
    
    let viewModel = ProfileViewModel()
    let flowLayout = UICollectionViewFlowLayout()
    let topView = UIView()
    let dismissButton = UIButton()
    let titleLabel = UILabel()
    let appendButton = UIButton()
    var fetchResult = PHFetchResult<PHAsset>()
    var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
        setupImage()
    }
    
    private func setupView() {
        
        self.view.backgroundColor = .white
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = .white
        self.view.addSubview(topView)
        
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.setTitle("✕", for: .normal)
        dismissButton.setTitleColor(.black, for: .normal)
        dismissButton.titleLabel?.font = .systemFont(ofSize: 25, weight: .light)
        dismissButton.addTarget(self, action: #selector(dismissButtonDidTapped), for: .touchUpInside)
        topView.addSubview(dismissButton)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "최근 항목"
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 20, weight: .light)
        titleLabel.sizeToFit()
        topView.addSubview(titleLabel)
    
        appendButton.translatesAutoresizingMaskIntoConstraints = false
        appendButton.setTitle("첨부", for: .normal)
        appendButton.setTitleColor(.lightGray, for: .normal)
        appendButton.titleLabel?.font = .systemFont(ofSize: 14)
        appendButton.addTarget(self, action: #selector(appendButtonDidTapped), for: .touchUpInside)
        topView.addSubview(appendButton)
        
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        guard let collectionView = collectionView else { return }
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "ImageCollectionViewCell")
        self.view.addSubview(collectionView)
        
    }
    
    private func setConstraints() {
        
        if collectionView != nil {
            
            NSLayoutConstraint.activate([
                collectionView!.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                collectionView!.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                collectionView!.topAnchor.constraint(equalTo: topView.bottomAnchor),
                collectionView!.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
            
            NSLayoutConstraint.activate([
                topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                topView.heightAnchor.constraint(equalToConstant: 56)
            ])
            
            NSLayoutConstraint.activate([
                dismissButton.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 20),
                dismissButton.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
                dismissButton.widthAnchor.constraint(equalToConstant: 30),
                dismissButton.heightAnchor.constraint(equalToConstant: 30)
            ])
            
            NSLayoutConstraint.activate([
                titleLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
                titleLabel.centerYAnchor.constraint(equalTo: topView.centerYAnchor)
            ])
            
            NSLayoutConstraint.activate([
                appendButton.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -20),
                appendButton.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
                appendButton.heightAnchor.constraint(equalToConstant: 30)
            ])
        }
    }
    
    private func setupImage() {
        
        let requestOption = PHImageRequestOptions()
        requestOption.isSynchronous = true
        requestOption.isNetworkAccessAllowed = true
        
        self.fetchResult = PHAsset.fetchAssets(with: nil)
        if fetchResult.count > 0 {
            self.fetchResult.enumerateObjects { (asset, i, _) in
                PHImageManager().requestImage(for: asset, targetSize: PHImageManagerMaximumSize, contentMode: .aspectFill, options: requestOption) { (image, info) in
                    guard let image = image else { return }
                    let fileName = asset.value(forKey: "filename") as! String
                    print("imageName: \(fileName), image: \(image)")
                    self.viewModel.images.append(image)
                }
            }
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
            }
        }
    }
    
    @objc private func dismissButtonDidTapped() {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func appendButtonDidTapped() {
        
        self.dismiss(animated: true, completion: nil)
    }
}

//
//  ImagePickerService.swift
//  TStoryApp
//
//  Created by yumin chu on 2022/05/20.
//

import UIKit
import Photos
import PhotosUI

class ImagePickerService {
    
    weak var viewController: UIViewController!
    weak var imagePicker: UIImagePickerController?
    
    init(viewController: UIViewController, imagePicker: UIImagePickerController) {
        
        self.viewController = viewController
        self.imagePicker = imagePicker
    }
    
    deinit {
        
        self.viewController = nil
        self.imagePicker = nil
    }
    
    func getImagePickerInfo(picker: UIImagePickerController, info: [UIImagePickerController.InfoKey : Any]) -> UIImage? {
        
        var imageName: String = ""
        var image: UIImage?
        var imageData: Data?
        var size: Float?
        
        if picker.sourceType == .camera {
            
            
        }
        else {
            
            if let asset = info[UIImagePickerController.InfoKey.phAsset] as? PHAsset {
                
                let manager = PHImageManager.default()
                let option = PHImageRequestOptions()
                option.isSynchronous = true
                manager.requestImage(for: asset, targetSize: CGSize(width: asset.pixelWidth, height: asset.pixelHeight), contentMode: .aspectFill, options: option) { requestImage, info in
                    
                    imageName = asset.value(forKey: "filename") as! String
                    image = requestImage
                    if image != nil {
                        
                        imageData = image?.jpegData(compressionQuality: 0.8)
                    }
                    size = Float(imageData?.count ?? 0) / 1000 / 1000
                    print("asset: \(asset), size: \(size ?? 0 * 1000000)MB")
                }
            }
        }
        
        return image
    }
    
    //MARK: 사진을 가져오는 권한을 체크하고 권한에 따라 다른 결과를 보여준다
    func checkPhotoAuthStatus() {
        
        guard let imagePicker = imagePicker else { return }
        
        imagePicker.sourceType = .photoLibrary
        let photoStatus: PHAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
        
        switch photoStatus {
            
        case .authorized:
            viewController.present(imagePicker, animated: true, completion: nil)
            
        case .limited:
            let vc = ImageCollectionViewController()
            vc.modalPresentationStyle = .overCurrentContext
            viewController.present(vc, animated: true, completion: nil)
            
        case .notDetermined:
            if #available(iOS 14, *) {
                PHPhotoLibrary.requestAuthorization(for: .readWrite) { state in
                    
                    DispatchQueue.main.async {
                        
                        if state == .authorized {
                            self.viewController.present(imagePicker, animated: true)
                        }
                        else if state == .limited {
                            let fetchOptions = PHFetchOptions()
                            let fetchResult = PHAsset.fetchAssets(with: fetchOptions)
                            if fetchResult.count != 0 {
                                
                                let vc = ImageCollectionViewController()
                                vc.modalPresentationStyle = .overCurrentContext
                                self.viewController.present(vc, animated: true, completion: nil)
                            }
                        }
                        else if state == .denied {
                            
                            let alert = self.getPermissionAlert()
                            self.viewController.present(alert, animated: true)
                        }
                    }
                }
            } else {
                // Fallback on earlier versions
                PHPhotoLibrary.requestAuthorization { state in
                    
                    DispatchQueue.main.async {
                        
                        if state == .authorized {
                            self.viewController.present(imagePicker, animated: true)
                        }
                        else if state == .denied {
                            
                            let alert = self.getPermissionAlert()
                            self.viewController.present(alert, animated: true)
                        }
                    }
                }
            }
            
        case .denied:
            let alert = getPermissionAlert()
            viewController.present(alert, animated: true)
            
        case .restricted:
            let alert = getPermissionAlert()
            viewController.present(alert, animated: true)
            
        default:
            break
        }
    }
    
    func getPermissionAlert() -> UIAlertController {
        
        let alert = UIAlertController(title: "접근을 허용해주세요.", message: "해당 기능 사용을 위해 설정에서 접근을 허용해주세요.", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "설정", style: .default) { action in
            if let settingUrl = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(settingUrl)
            }
        }
        alert.addAction(alertAction)
        return alert
    }
}

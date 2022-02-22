//
//  FullScreenVisitLogWebTopView.swift
//  TStoryApp
//
//  Created by yumin chu on 2021/11/25.
//

import UIKit

class FullScreenVisitLogWebTopView: UIView {
    
    lazy var dismissFullScreenVisitLogWebViewButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("〈", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30, weight: .light)
        addSubview(button)
        return button
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
            dismissFullScreenVisitLogWebViewButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            dismissFullScreenVisitLogWebViewButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            dismissFullScreenVisitLogWebViewButton.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
}

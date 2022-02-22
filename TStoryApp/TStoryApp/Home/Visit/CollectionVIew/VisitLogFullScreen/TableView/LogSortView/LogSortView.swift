//
//  LogSortView.swift
//  TStoryApp
//
//  Created by yumin chu on 2021/11/16.
//

import UIKit

protocol LogSortViewDelegate: AnyObject {
    func LogSortViewDidTapped(at index: Int)
}
class LogSortView: UIView {
    
    var isSelected: Int = 0
    weak var delegate: LogSortViewDelegate?
    
    lazy var logSortStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .clear
        stackView.axis = .vertical
        stackView.spacing = 0
        self.addSubview(stackView)
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
            logSortStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            logSortStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            logSortStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setStackView() {
        let logSortArr: [String] = ["최신순", "유입순"]
        for i in 0 ..< logSortArr.count {
            let logSortView = UIView()
            logSortView.translatesAutoresizingMaskIntoConstraints = false
            logSortView.backgroundColor = .clear
            logSortView.tag = i
            logSortStackView.addArrangedSubview(logSortView)
            let gesture = UITapGestureRecognizer(target: self, action: #selector(logSortViewDidTapped))
            logSortView.addGestureRecognizer(gesture)
            
            let viewText = UILabel()
            viewText.translatesAutoresizingMaskIntoConstraints = false
            viewText.text = logSortArr[i]
            viewText.textColor = .black
            viewText.font = .systemFont(ofSize: 16, weight: isSelected == i ? UIFont.Weight.bold : UIFont.Weight.light)
            logSortView.addSubview(viewText)
            viewText.leadingAnchor.constraint(equalTo: logSortView.leadingAnchor, constant: 20).isActive = true
            viewText.topAnchor.constraint(equalTo: logSortView.topAnchor, constant: 25).isActive = true
            viewText.bottomAnchor.constraint(equalTo: logSortView.bottomAnchor, constant: -25).isActive = true
            
            if i == logSortArr.count - 1 { return }
            let separator = UIView()
            separator.translatesAutoresizingMaskIntoConstraints = false
            separator.backgroundColor = .lightGray.withAlphaComponent(0.5)
            logSortStackView.addArrangedSubview(separator)
            separator.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        }
    }
    
    @objc private func logSortViewDidTapped(gesture: UITapGestureRecognizer) {
        guard let tag = gesture.view?.tag else { return }
        delegate?.LogSortViewDidTapped(at: tag)
    }
    
    func setIsSelected(index: Int) {
        self.isSelected = index
    }

}

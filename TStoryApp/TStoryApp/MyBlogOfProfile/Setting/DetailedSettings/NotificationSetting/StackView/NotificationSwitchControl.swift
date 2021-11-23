//
//  NotificationSwitchView.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/22.
//

import UIKit

class NotificationSwitchControl: UIControl {
    
    var onTintColor = UIColor.lightGray //직사각형 모양의 bar color
    var offTintColor = UIColor.lightGray.withAlphaComponent(0.3)
    var cornerRadius: CGFloat = 0.5
    
    var thumbTintColor = UIColor.black //클릭하면 움직이는 switch의 원 color
    var thumbOffTintColor = UIColor.white
    var thumbCornerRadius: CGFloat = 0.5
    var thumbSize = CGSize.zero
    
    var padding: CGFloat = 1
    var switchIsOn = true
    var animationDuration: Double = 0.5
    
    
    private lazy var thumbView = UIView(frame: .zero)//switch 흰색 원
    private var onPoint = CGPoint.zero
    private var offPoint = CGPoint.zero
    private var isAnimating = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func clear() {//UI 재설정에 대비하여 view 계층의 모든 걸 제거
        for view in self.subviews {
            view.removeFromSuperview()
        }
    }
    
    func setupUI() {//UI 초기 구성에 사용
        self.clear()
        self.clipsToBounds = false
        self.thumbView.backgroundColor = self.thumbTintColor
        self.thumbView.isUserInteractionEnabled = false
        self.addSubview(self.thumbView)
    }
    
    public override func layoutSubviews() {//함수 재정의
        //뷰와 하위 뷰의 프레임을 직접 설정
        super.layoutSubviews()
        if !self.isAnimating{
            self.layer.cornerRadius = self.bounds.size.height * self.cornerRadius
            self.backgroundColor = self.switchIsOn ? self.onTintColor : self.offTintColor
            
            //switch 원
            let thumbSize = self.thumbSize != CGSize.zero ? self.thumbSize: CGSize(width: self.bounds.size.height + 4, height: self.bounds.size.height + 4)
            let yPostition = (self.bounds.size.height - thumbSize.height) / 2
            self.onPoint = CGPoint(x: self.bounds.size.width - thumbSize.width - self.padding, y: yPostition)
            self.offPoint = CGPoint(x: self.padding, y: yPostition)
            
            self.thumbView.frame = CGRect(origin: self.switchIsOn ? self.onPoint : self.offPoint, size: thumbSize)
            self.thumbView.layer.cornerRadius = thumbSize.height * self.thumbCornerRadius
            self.thumbView.layer.shadowColor = UIColor.black.cgColor
            self.thumbView.layer.shadowRadius = 1.5
            self.thumbView.layer.shadowOpacity = 0.4
            self.thumbView.layer.shadowOffset = CGSize(width: 0.75, height: 2)
        }
    }
    
    private func animate() {
        self.switchIsOn = !self.switchIsOn
        self.isAnimating = true
        
        UIView.animate(withDuration: self.animationDuration, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: [UIView.AnimationOptions.curveEaseOut, UIView.AnimationOptions.beginFromCurrentState], animations: { self.thumbView.frame.origin.x = self.switchIsOn ? self.onPoint.x : self.offPoint.x
            self.backgroundColor = self.switchIsOn ? self.onTintColor : self.offTintColor
            self.thumbView.backgroundColor = self.switchIsOn ? self.thumbTintColor : self.thumbOffTintColor
        }, completion: {
            _ in self.isAnimating = false
            self.sendActions(for: UIControl.Event.valueChanged)
        })
        print(self.isAnimating == true ? true : false)
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {//UIControl touch 이벤트를 관리하는 메서드
        super.beginTracking(touch, with: event)
        self.animate()
        self.switchIsOn ? (switchIsOn = true) : (switchIsOn = false)
        return true
    }
    
    func setSwitchOnColor(switchIsOn: Bool){
        self.thumbView.backgroundColor = switchIsOn ? self.thumbTintColor : self.thumbOffTintColor
    }

}

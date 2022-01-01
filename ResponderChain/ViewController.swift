//
//  ViewController.swift
//  ResponderChain
//
//  Created by 유재호 on 2022/01/01.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
}

class WhiteView: UIView {
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if !isUserInteractionEnabled || isHidden || alpha <= 0.01 {
            return nil
        }
     
        if self.point(inside: point, with: event) {
            for subview in subviews.reversed() {
                let convertedPoint = subview.convert(point, from: self)
                if let hitTestView = subview.hitTest(convertedPoint, with: event) {
                    print("WhiteView hitTest 결과 : \(hitTestView)")
                    return hitTestView
                }
            }
            print("WhiteView 가 '뷰계층'에서 제일 깊은 뷰")
            return self
        }
        return nil
    }
}

class GreenView: UIView, UIGestureRecognizerDelegate {
    
    func changeColor() {
        if self.backgroundColor == .systemGreen {
            self.backgroundColor = .black
        } else {
            self.backgroundColor = .systemGreen
        }
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if !isUserInteractionEnabled || isHidden || alpha <= 0.01 {
            return nil
        }
     
        if self.point(inside: point, with: event) {
            for subview in subviews.reversed() {
                // reversed 를 해준 이유? -> subview 배열에서 가장 뒤에 있는 (가장 화면에서 가까운) 화면을 부르기 위함임
                let convertedPoint = subview.convert(point, from: self)
                if let hitTestView = subview.hitTest(convertedPoint, with: event) {
                    print("GreenView hitTest 결과 : \(hitTestView)")
                    return hitTestView
                }
            }
            // hitTest 의 목적은 view 를 찾기 위한 것.
            // 가장 뒤에있는 뷰 부터, 가장 앞에 있는 뷰를 검색하는 과정.
            print("GreenView 가 '뷰계층'에서 제일 깊은 뷰")
            return self
        }
        return nil
    }
}

class OrangeView: UIView {
    
    override func addGestureRecognizer(_ gestureRecognizer: UIGestureRecognizer) {
        print("OrangeView 제스쳐 눌림")
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if !isUserInteractionEnabled || isHidden || alpha <= 0.01 {
            return nil
        }
     
        if self.point(inside: point, with: event) {
            for subview in subviews.reversed() {
                let convertedPoint = subview.convert(point, from: self)
                if let hitTestView = subview.hitTest(convertedPoint, with: event) {
                    print("OrangeView hitTest 결과 : \(hitTestView)")
                    return hitTestView
                }
            }
            print("OrangeView 가 '뷰계층'에서 제일 깊은 뷰")
            return self
        }
        return nil
    }
}

class PurpleView: UIView {
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if !isUserInteractionEnabled || isHidden || alpha <= 0.01 {
            return nil
        }
     
        if self.point(inside: point, with: event) {
            for subview in subviews.reversed() {
                let convertedPoint = subview.convert(point, from: self)
                if let hitTestView = subview.hitTest(convertedPoint, with: event) {
                    print("PurpleView hitTest 결과 : \(hitTestView)")
                    return hitTestView
                }
            }
            print("PurpleView 가 '뷰계층'에서 제일 깊은 뷰")
            return self
        }
        return nil
    }
}

class BlueView: UIView {
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if !isUserInteractionEnabled || isHidden || alpha <= 0.01 {
            return nil
        }
     
        if self.point(inside: point, with: event) {
            for subview in subviews.reversed() {
                let convertedPoint = subview.convert(point, from: self)
                if let hitTestView = subview.hitTest(convertedPoint, with: event) {
                    print("BlueView hitTest 결과 : \(hitTestView)")
                    return hitTestView
                }
            }
            print("BlueView 가 '뷰계층'에서 제일 깊은 뷰")
            return self
        }
        return nil
    }
}

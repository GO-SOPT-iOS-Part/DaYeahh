//
//  File.swift
//  GO_SOPT_Seminar_Assingment
//
//  Created by 김다예 on 2023/04/08.
//

import UIKit

extension UIButton {
    func animateButton() {
        UIView.animate(withDuration: 0.025) {
            self.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        } completion: { _ in
            UIView.animate(withDuration: 0.05) {
                self.transform = .identity
            }
        }
    }
//    func pulseButton(){
//        let pulseLayer: CAShapeLayer = {
//            let shape = CAShapeLayer()
//            shape.strokeColor = UIColor.clear.cgColor
//            shape.lineWidth = 10
//            shape.fillColor = UIColor.white.withAlphaComponent(0.3).cgColor
//            shape.lineCap = .round
//            return shape
//        }()
//        func setupShapes() {
//            setNeedsLayout()
//            layoutIfNeeded()
//
//            let backgroundLayer = CAShapeLayer()
//
//            let circularPath = UIBezierPath(arcCenter: self.center, radius: bounds.size.height/2, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
//
//            pulseLayer.frame = bounds
//            pulseLayer.path = circularPath.cgPath
//            pulseLayer.position = self.center
//            self.layer.addSublayer(pulseLayer)
//
//            backgroundLayer.path = circularPath.cgPath
//            backgroundLayer.lineWidth = 10
//            backgroundLayer.fillColor = UIColor.blue.cgColor
//            backgroundLayer.lineCap = .round
//            self.layer.addSublayer(backgroundLayer)
//        }
//
//        func pulse() {
//            let animation = CABasicAnimation(keyPath: "transform.scale")
//            animation.toValue = 1.2
//            animation.duration = 1.0
//            animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
//            animation.autoreverses = true
//            animation.repeatCount = .infinity
//            pulseLayer.add(animation, forKey: "pulsing")
//        }
//    }
}

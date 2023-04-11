//
//  File.swift
//  GO_SOPT_Seminar_Assingment
//
//  Created by 김다예 on 2023/04/08.
//

import UIKit

extension UIButton {
    func animateButton() {
        UIView.animate(withDuration: 0.015) {
            self.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        } completion: { _ in
            UIView.animate(withDuration: 0.05) {
                self.transform = .identity
            }
        }
    }
}
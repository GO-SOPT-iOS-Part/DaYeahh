//
//  UITextField+.swift
//  GO_SOPT_Seminar_Assingment
//
//  Created by 김다예 on 2023/04/11.
//

import UIKit

public extension UITextField {
    
    func setPlaceholderColor(_ placeholderColor: UIColor) {
        attributedPlaceholder = NSAttributedString(
            string: placeholder ?? "",
            attributes: [
                .foregroundColor: placeholderColor,
                .font: font
            ].compactMapValues { $0 }
        )
    }
}

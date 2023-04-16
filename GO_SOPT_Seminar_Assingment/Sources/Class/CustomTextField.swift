//
//  CustomTextField.swift
//  GO_SOPT_Seminar_Assingment
//
//  Created by 김다예 on 2023/04/17.
//

import UIKit

import SnapKit
import Then

class CustomTextField: UITextField {
    
    private lazy var clearButton = UIButton().then {
        $0.setImage(UIImage(named: "x-circle"), for: .normal)
        $0.isHidden = true
        $0.addTarget(self, action: #selector(clearTextField), for: .touchUpInside)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func style() {
        self.setLeftRightPadding()
        self.layer.cornerRadius = 3
    }
    
    func setLayout() {
        self.addSubview(clearButton)
        
        clearButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(20)
        }
    }
    
    @objc
    func clearTextField() {
        self.text = ""
    }
}


class CustomPasswordTextField: UITextField {
    
    private var securityTrue: Bool = true
    
    private lazy var clearButton = UIButton().then {
        $0.setImage(UIImage(named: "x-circle.png"), for: .normal)
        $0.isHidden = true
        $0.addTarget(self, action: #selector(clearTextField), for: .touchUpInside)
    }
    
    public lazy var securityBtn = UIButton().then {
        $0.setImage(UIImage(named: "eye-slash.png"), for: .normal)
        $0.addTarget(self, action: #selector(securityTextField), for: .touchUpInside)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func style() {
        self.setLeftRightPadding()
        self.layer.cornerRadius = 3
        self.isSecureTextEntry = securityTrue
    }
    
    func setLayout() {
        self.addSubviews(clearButton, securityBtn)

        securityBtn.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(20)
        }
        
        clearButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(securityBtn.snp.leading).offset(-16)
        }
    }
    
    @objc
    func clearTextField() {
        self.text = ""
    }
    
    @objc
    func securityTextField() {
        securityTrue = !securityTrue
        let securityBtnImg = securityTrue ? UIImage(named: "eye-slash.png") : UIImage(named: "eye-non-slash.png")
        securityBtn.setImage(securityBtnImg, for: .normal)
    }
}

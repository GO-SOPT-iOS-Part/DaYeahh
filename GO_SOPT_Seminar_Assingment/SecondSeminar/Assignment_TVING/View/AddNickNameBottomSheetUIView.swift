//
//  AddNickNameBottomSheetUIView.swift
//  GO_SOPT_Seminar_Assingment
//
//  Created by 김다예 on 2023/04/15.
//

import UIKit

class AddNickNameBottomSheetUIView: PassThroughView {
    
    private let nickNameMainLabel = UILabel().then {
        $0.text = "닉네임을 입력하세요"
        $0.font = .tvingMedium(ofSize: 23)
    }
    
    private let nickNameTextField = UITextField().then {
        $0.placeholder = "닉네임"
        $0.setPlaceholderColor(.tvingGray1)
        $0.textColor = .black
        $0.backgroundColor = .tvingGray2
        $0.font = .tvingMedium(ofSize: 14)
        $0.layer.cornerRadius = 3
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 22.0, height: 0.0))
        $0.leftViewMode = .always
    }
    
    private lazy var saveNickNameBtn = UIButton().then {
        $0.setTitle("저장하기", for: .normal)
        $0.titleLabel?.font = .tvingMedium(ofSize: 16)
        $0.titleLabel?.textAlignment = .center
        $0.titleLabel?.textColor = .white
        $0.backgroundColor = .tvingRed
        $0.layer.cornerRadius = 12
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        hierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension AddNickNameBottomSheetUIView {
    
    func style() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 12
        self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]   // 좌우측 하단은 그대로
    }
    
    func hierarchy() {
        self.addSubviews(nickNameMainLabel, nickNameTextField, saveNickNameBtn)
    }
    
    func setLayout() {

        nickNameMainLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(45)
            $0.leading.equalToSuperview().inset(20)
        }

        nickNameTextField.snp.makeConstraints {
            $0.height.equalTo(52)
            $0.top.equalTo(nickNameMainLabel.snp.bottom).offset(21)
            $0.leading.trailing.equalToSuperview().inset(20)
        }

        saveNickNameBtn.snp.makeConstraints {
            $0.height.equalTo(52)
            $0.bottom.equalToSuperview().inset(20.81)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
    }
}

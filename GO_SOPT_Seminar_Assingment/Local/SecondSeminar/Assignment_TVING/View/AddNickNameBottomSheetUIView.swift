//
//  AddNickNameBottomSheetUIView.swift
//  GO_SOPT_Seminar_Assingment
//
//  Created by 김다예 on 2023/04/15.
//

import UIKit

class AddNickNameBottomSheetUIView: UIView {
    
    public let bottomSheetHeight = UIScreen.main.bounds.height / 2
    
    public let bottomSheetView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 12
        $0.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]   // 좌우측 하단은 그대로
    }
    
    public let nickNameMainLabel = UILabel().then {
        $0.text = "닉네임을 입력해주세요"
        $0.font = .tvingMedium(ofSize: 23)
    }
    
    public let nickNameTextField = CustomTextField().then {
        $0.placeholder = "닉네임"
        $0.setPlaceholderColor(.tvingGray1)
        $0.textColor = .black
        $0.backgroundColor = .tvingGray2
        $0.font = .tvingMedium(ofSize: 14)
    }
    
    public lazy var saveNickNameBtn = UIButton().then {
        $0.setTitle("저장하기", for: .normal)
        $0.titleLabel?.font = .tvingMedium(ofSize: 16)
        $0.titleLabel?.textAlignment = .center
        $0.titleLabel?.textColor = .tvingGray2
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 12
        $0.isEnabled = false
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
        self.backgroundColor = .black.withAlphaComponent(0.5)
    }
    
    func hierarchy() {
        self.addSubview(bottomSheetView)
        bottomSheetView.addSubviews(nickNameMainLabel, nickNameTextField, saveNickNameBtn)
    }
    
    func setLayout() {
        
        bottomSheetView.snp.makeConstraints {
            $0.height.equalTo(bottomSheetHeight)
            $0.bottom.left.right.equalToSuperview()
            $0.top.equalToSuperview().inset(UIEdgeInsets(top: UIScreen.main.bounds.height - bottomSheetHeight, left: 0, bottom: 0, right: 0))
        }

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
            $0.bottom.equalToSuperview().inset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
    
    
}

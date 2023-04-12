//
//  LoginViewController_TVING.swift
//  GO_SOPT_Seminar_Assingment
//
//  Created by 김다예 on 2023/04/11.
//

import UIKit

import SnapKit
import Then

class LoginViewController_TVING: UIViewController {
    
    // MARK: - Object Setting
    
    private let mainLabel = UILabel().then {
        $0.text = "TVING ID 로그인"
        $0.font = .tvingMedium(ofSize: 23)
        $0.textColor = .tvingGray1
        $0.textAlignment = .center
    }
    
    private let idTextField = UITextField().then {
        $0.placeholder = "아이디"
        $0.setPlaceholderColor(.tvingGray2)
        $0.font = .tvingMedium(ofSize: 15)
        $0.backgroundColor = .tvingGray4
        $0.layer.cornerRadius = 3
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 22.0, height: 0.0))
        $0.leftViewMode = .always
    }
    
    private let passwordTextField = UITextField().then {
        $0.placeholder = "비밀번호"
        $0.setPlaceholderColor(.tvingGray2)
        $0.font = .tvingMedium(ofSize: 15)
        $0.backgroundColor = .tvingGray4
        $0.layer.cornerRadius = 3
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 22.0, height: 0.0))
        $0.leftViewMode = .always
    }
    
    private lazy var logInBtn = UIButton().then {
        $0.setTitle("로그인하기", for: .normal)
        $0.setTitleColor(.tvingGray2, for: .normal)
        $0.titleLabel?.font = .tvingMedium(ofSize: 14)
        $0.titleLabel?.textAlignment = .center
        $0.layer.borderColor = UIColor.tvingGray4.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 3
    }
    
    private lazy var findIdBtn = UIButton().then {
        $0.setTitle("아이디 찾기", for: .normal)
        $0.setTitleColor(.tvingGray2, for: .normal)
        $0.titleLabel?.font = .tvingMedium(ofSize: 14)
        $0.titleLabel?.textAlignment = .center
    }
    
    private lazy var findPasswordBtn = UIButton().then {
        $0.setTitle("비밀번호 찾기", for: .normal)
        $0.setTitleColor(.tvingGray2, for: .normal)
        $0.titleLabel?.font = .tvingMedium(ofSize: 14)
        $0.titleLabel?.textAlignment = .center
    }
    
    private let askExistAccountLabel = UILabel().then {
        $0.text = "아직 계정이 없으신가요?"
        $0.font = .tvingRegular(ofSize: 14)
        $0.textColor = .tvingGray3
        $0.textAlignment = .center
    }
    
    private lazy var goToMakeNicknameBtn = UIButton().then {
        $0.setTitle("닉네임 만들러가기", for: .normal)
        $0.setTitleColor(.tvingGray2, for: .normal)
        $0.titleLabel?.font = .tvingRegular(ofSize: 14)
        $0.titleLabel?.textAlignment = .center
        $0.setUnderline()
    }
    
    private lazy var backBtn = UIButton().then {
        $0.setImage(UIImage(named: "btn_before"), for: .normal)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        style()
        setLayout()
    }

}

private extension LoginViewController_TVING{
    
    func style() {
        
        view.backgroundColor = .black
    }
    
    func setLayout() {
        
        view.addSubviews(mainLabel, idTextField, passwordTextField, logInBtn, findIdBtn, findPasswordBtn, askExistAccountLabel, goToMakeNicknameBtn, backBtn)
        
        mainLabel.snp.makeConstraints{
            $0.height.equalTo(37)
            $0.width.equalTo(192)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(50)
            $0.centerX.equalToSuperview()
        }
        
        idTextField.snp.makeConstraints{
            $0.height.equalTo(52)
            $0.top.equalTo(mainLabel.snp.bottom).offset(31)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        passwordTextField.snp.makeConstraints{
            $0.height.equalTo(52)
            $0.top.equalTo(idTextField.snp.bottom).offset(7)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        logInBtn.snp.makeConstraints{
            $0.height.equalTo(52)
            $0.top.equalTo(passwordTextField.snp.bottom).offset(21)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        findIdBtn.snp.makeConstraints{
            $0.width.equalTo(70)
            $0.height.equalTo(22)
            $0.top.equalTo(logInBtn.snp.bottom).offset(31)
            $0.leading.equalToSuperview().inset(85)
        }
        
        findPasswordBtn.snp.makeConstraints{
            $0.width.equalTo(80)
            $0.height.equalTo(22)
            $0.top.equalTo(logInBtn.snp.bottom).offset(31)
            $0.trailing.equalToSuperview().inset(86)
        }
        askExistAccountLabel.snp.makeConstraints{
            $0.width.equalTo(140)
            $0.height.equalTo(22)
            $0.top.equalTo(logInBtn.snp.bottom).offset(81)
            $0.leading.equalToSuperview().inset(51)
        }
        
        goToMakeNicknameBtn.snp.makeConstraints{
            $0.width.equalTo(128)
            $0.height.equalTo(22)
            $0.top.equalTo(logInBtn.snp.bottom).offset(81)
            $0.trailing.equalToSuperview().inset(50)
        }
        backBtn.snp.makeConstraints{
            $0.height.equalTo(15)
            $0.width.equalTo(8)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(25)
            $0.leading.equalToSuperview().inset(24)
        }
    }
}

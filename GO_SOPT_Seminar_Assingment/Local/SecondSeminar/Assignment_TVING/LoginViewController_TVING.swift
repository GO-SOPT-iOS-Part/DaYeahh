//
//  LoginViewController_TVING.swift
//  GO_SOPT_Seminar_Assingment
//
//  Created by 김다예 on 2023/04/11.
//

import UIKit

import SnapKit
import Then

class LoginViewController_TVING: BaseViewController {
    
    // MARK: - Property
    
    private let mainView = LoginView()
    private let nickNameBottomSheet = AddNickNameBottomSheetUIView()
    
    public var user = TvingUserInfo()
    
    // MARK: - Target
    
    private func target() {
        mainView.idTextField.delegate = self
        mainView.passwordTextField.delegate = self
        mainView.idTextField.addTarget(self, action: #selector(textFieldDidChange), for: .allEditingEvents)
        mainView.passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .allEditingEvents)
        
        mainView.idClearBtn.addTarget(self, action: <#T##Selector#>, for: .touchUpInside)
        mainView.passwordClearBtn.addTarget(self, action: <#T##Selector#>, for: .touchUpInside)
        
        mainView.logInBtn.addTarget(self, action: #selector(tappedLogInBtn), for: .touchUpInside)
        mainView.goToMakeNicknameBtn.addTarget(self, action: #selector(tappedMakeNickNameBtn), for: .touchUpInside)
    }
    
    private func targetBottomSheet() {
        nickNameBottomSheet.saveNickNameBtn.addTarget(self, action: #selector(tappedSavedNickNameBtn), for: .touchUpInside)
        nickNameBottomSheet.nickNameTextField.delegate = self
    }
    
    // MARK: - Lift Cycle
    
    override func loadView() {
        self.view = mainView
        view.addSubview(nickNameBottomSheet)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        target()
        targetBottomSheet()
    }

}

private extension LoginViewController_TVING {
    
    @objc
    func tappedLogInBtn() {
        let welcomViewController = WelcomeViewController()
        saveUserEmail()
        welcomViewController.idDataBind(idOrNick: user.nickName == "" ? user.id : user.nickName)
        self.navigationController?.pushViewController(welcomViewController, animated: true)
    }
    
    func saveUserEmail(){
        guard let id = mainView.idTextField.text else { return }
        user.id = id
    }
    
    @objc
    func tappedMakeNickNameBtn() {
        showBottomSheet()
    }
    
    @objc
    func tappedSavedNickNameBtn() {
        guard let nickName = nickNameBottomSheet.nickNameTextField.text else { return }
        user.nickName = nickName
        print(user.nickName)
        hideBottomSheet()
    }
    
    @objc
    func tappedClearBtn() {
        
    }
    
    func showBottomSheet() {
        nickNameBottomSheet.snp.remakeConstraints {
            $0.edges.equalToSuperview()
        }
        UIView.animate(
            withDuration: 0.25,
            delay: 0,
            animations: {
                self.nickNameBottomSheet.bottomSheetView.layoutIfNeeded()
            }
        )
    }
    
    func hideBottomSheet() {
        nickNameBottomSheet.snp.remakeConstraints {
            $0.width.equalToSuperview()
            $0.top.equalTo(view.snp.bottom)
        }
        UIView.animate(
            withDuration: 0.25,
            delay: 0,
            animations: {
                self.nickNameBottomSheet.bottomSheetView.layoutIfNeeded()
            }
        )
    }
    
}

extension LoginViewController_TVING: UITextFieldDelegate {
    
    // textField가 활성화되면
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.tvingGray2.cgColor
        textField.layer.borderWidth = 0.7
    }
    
    // textField 편집 중
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        return true
    }
    
    // textField 비활성화되면
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.layer.borderWidth = 0
        return true
    }
    
    @objc
    func textFieldDidChange(_ textField: UITextField) {
        mainView.idClearBtn.isHidden = mainView.idTextField.isEmpty()
        mainView.passwordClearBtn.isHidden = mainView.passwordTextField.isEmpty()
        
        
        if (!mainView.idTextField.isEmpty() && !mainView.passwordTextField.isEmpty()) {
            mainView.logInBtn.isEnabled = true
            mainView.logInBtn.backgroundColor = .tvingRed
            mainView.logInBtn.setTitleColor(.white, for: .normal)
        }else {
            mainView.logInBtn.isEnabled = false
            mainView.logInBtn.backgroundColor = .clear
            mainView.logInBtn.setTitleColor(.tvingGray2, for: .normal)
        }
    }
    
}

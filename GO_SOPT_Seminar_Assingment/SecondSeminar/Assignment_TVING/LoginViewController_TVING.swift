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
    
    // MARK: - BottomSheet Setting
    
    private let mainView = LoginView()
    private let nickNameBottomSheet = AddNickNameBottomSheetUIView()
    
    private func targetBottomSheet() {
        nickNameBottomSheet.saveNickNameBtn.addTarget(self, action: #selector(tappedSavedNickNameBtn), for: .touchUpInside)
        nickNameBottomSheet.nickNameTextField.delegate = self
    }
    
    private func target() {
        mainView.logInBtn.addTarget(self, action: #selector(tappedLogInBtn), for: .touchUpInside)
        mainView.goToMakeNicknameBtn.addTarget(self, action: #selector(tappedMakeNickNameBtn), for: .touchUpInside)
    }
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        target()
    }

}

extension LoginViewController_TVING: UITextFieldDelegate {
    
}

private extension LoginViewController_TVING {
    
    @objc
    func tappedLogInBtn() {
        let welcomViewController = WelcomeViewController()
        saveUserEmail()

        self.navigationController?.pushViewController(welcomViewController, animated: true)
    }
    
    @objc
    func tappedMakeNickNameBtn() {
        
        self.view.addSubview(nickNameBottomSheet)
        nickNameBottomSheet.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        self.view.layoutIfNeeded()
        nickNameBottomSheet.show()
        targetBottomSheet()
    }
    
    @objc
    func tappedSavedNickNameBtn() {
        nickNameBottomSheet.hide()
    }
    
    func saveUserEmail(){
//        guard let email = idTextField.text else { return }
//        userEmail = email
    }
}

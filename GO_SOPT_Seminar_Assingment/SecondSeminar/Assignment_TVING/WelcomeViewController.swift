//
//  WelcomeViewController.swift
//  GO_SOPT_Seminar_Assingment
//
//  Created by 김다예 on 2023/04/12.
//

import UIKit

class WelcomeViewController: BaseViewController {
    
    private let mainView = WelcomeView()
    
    private func target() {
        mainView.goToMainBtn.addTarget(self, action: #selector(tappedGoToMainBtn), for: .touchUpInside)
    }

    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        target()
    }
}

extension WelcomeViewController {
    
    @objc
    func tappedGoToMainBtn() {
        self.navigationController?.popViewController(animated: true)
    }
}

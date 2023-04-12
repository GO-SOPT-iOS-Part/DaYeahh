//
//  WelcomeViewController.swift
//  GO_SOPT_Seminar_Assingment
//
//  Created by 김다예 on 2023/04/12.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private let mainImgView = UIImageView().then {
        $0.image = UIImage(named: "tiving_logo")
    }
    
    private let welcomeLabel = UILabel().then {
        $0.text = "님\n반가워요!"
        $0.numberOfLines = 2
        $0.font = .tvingSemiBold(ofSize: 23)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private lazy var goToMainBtn = UIButton().then {
        $0.setTitle("메인으로", for: .normal)
        $0.titleLabel?.font = .tvingMedium(ofSize: 14)
        $0.titleLabel?.textAlignment = .center
        $0.backgroundColor = .tvingRed
        $0.layer.cornerRadius = 3
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        style()
        setLayout()
    }
    
}

private extension WelcomeViewController {
    
    func style() {
        view.backgroundColor = .black
    }
    
    func setLayout() {
        
        view.addSubviews(mainImgView, welcomeLabel, goToMainBtn)
        
        mainImgView.snp.makeConstraints {
            $0.height.equalTo(mainImgView.snp.width).multipliedBy(0.56)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(14)
            $0.leading.trailing.equalToSuperview()
        }
        welcomeLabel.snp.makeConstraints {
            $0.height.equalTo(75)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(292)
            $0.leading.equalToSuperview().inset(75)
            $0.trailing.equalToSuperview().inset(74)
        }
        goToMainBtn.snp.makeConstraints {
            $0.height.equalTo(52)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(66)
        }
    }
}

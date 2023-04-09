//
//  FirstViewController_Practice1.swift
//  GO_SOPT_Seminar_Assingment
//
//  Created by 김다예 on 2023/04/08.
//

import UIKit
import SnapKit
import Then

class FirstViewController_Practice1: UIViewController {
    
    var viewHitCount:Int = 0

    private let stateLabel = UILabel().then{
        $0.text = "딱 10번만 누르고 와~!~!~!!!"
        $0.font = .boldSystemFont(ofSize: 20)
        $0.textColor = .black
        $0.textAlignment = .center
    }
    
    private lazy var nextBtn = UIButton().then{
        $0.setTitle("다음으로", for: .normal)
        $0.backgroundColor = .systemBlue
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16)
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(pushNextBtn),
                         for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setLayout()
    }
        
}

private extension FirstViewController_Practice1{
    
    func style() {
        
        view.backgroundColor = .white
    }
    func setLayout(){
        [stateLabel, nextBtn].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        stateLabel.snp.makeConstraints{
            $0.leading.leading.equalToSuperview().offset(30)
            $0.trailing.trailing.equalToSuperview().offset(-30)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(48)
        }
        nextBtn.snp.makeConstraints{
            $0.top.equalTo(stateLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(64)
            $0.width.equalTo(64)
        }

    }
    
    @objc
    func pushNextBtn() {
        let secondViewController = SecondViewController_Practice1()
        secondViewController.modalPresentationStyle = .fullScreen
        
        secondViewController.dataBind(cnt: viewHitCount)
        secondViewController.completionHandler = { [weak self] cnt in
            guard let self else { return }
            self.viewHitCount = cnt
            if (self.viewHitCount < 10){
                self.stateLabel.text = "조금만 더 눌러봥 \(self.viewHitCount)번 눌렀어!!!"
            }
            else{
                self.stateLabel.text = "아이콩 \(self.viewHitCount - 10)번이나 더 눌렀넹~~"
            }
        }
        self.present(secondViewController, animated: true)
    }
    
}




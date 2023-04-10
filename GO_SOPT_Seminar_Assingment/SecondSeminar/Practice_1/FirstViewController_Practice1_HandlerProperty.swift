//
//  FirstViewController_Practice1.swift
//  GO_SOPT_Seminar_Assingment
//
//  Created by 김다예 on 2023/04/08.
//

import UIKit
import SnapKit
import Then

class FirstViewController_Practice1_HandlerProperty: UIViewController {
    
    var viewHitCount:Int = 0

    private let stateLabel = UILabel().then{
        $0.text = "딱 '10번'만 누르고 와~!~!~!!!"
        $0.font = .boldSystemFont(ofSize: 20)
        $0.textColor = .black
        $0.asColor(targetString: "10번", color: UIColor.systemRed)
        $0.textAlignment = .center
    }
    
    private lazy var nextBtn = UIButton().then{
        $0.setTitle("누르러 가기", for: .normal)
        $0.backgroundColor = .systemIndigo
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

private extension FirstViewController_Practice1_HandlerProperty{
    
    func style() {
        
        view.backgroundColor = .white
    }
    func setLayout(){
        
        view.addSubviews(stateLabel, nextBtn)
        
        stateLabel.snp.makeConstraints{
            $0.leading.leading.equalToSuperview().offset(30)
            $0.trailing.trailing.equalToSuperview().offset(-30)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(48)
        }
        nextBtn.snp.makeConstraints{
            $0.top.equalTo(stateLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(48)
            $0.width.equalTo(128)
        }

    }
    
    @objc
    func pushNextBtn() {
        let secondViewController = SecondViewController_Practice1_HandlerProperty()
        secondViewController.modalPresentationStyle = .fullScreen
        
        secondViewController.dataBind(cnt: viewHitCount)
        secondViewController.completionHandler = { [weak self] cnt in
            guard let self else { return }
            self.viewHitCount = cnt
            if (self.viewHitCount < 10){
                self.stateLabel.text = "조금만 더 눌러봥 \(self.viewHitCount)번 눌렀어!!!"
            }else{
                self.stateLabel.text = "아이콩 \(self.viewHitCount - 10)번이나 더 눌렀넹~~"
            }
        }
        self.present(secondViewController, animated: true)
    }
    
}




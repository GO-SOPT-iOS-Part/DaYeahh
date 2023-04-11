//
//  FirstViewController_Practice1_DelegatePattern.swift
//  GO_SOPT_Seminar_Assingment
//
//  Created by 김다예 on 2023/04/10.
//

import UIKit

class FirstViewController_Practice1_DelegatePattern: UIViewController {

    private var hitCount:Int = 0 {
        didSet{
            self.nextBtn.setTitle( hitCount >= 10 ? "다시 시도하기" : "누르러 가기", for: .normal)
            self.nextBtn.backgroundColor = hitCount >= 10 ? UIColor.systemPink : UIColor.systemIndigo
        }
    }

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

private extension FirstViewController_Practice1_DelegatePattern{
    
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
        
        let secondViewController = SecondViewController_Practice1_DelegatePattern()
        hitCount = hitCount >= 10 ? 0 : hitCount
        secondViewController.delegate = self
        secondViewController.modalPresentationStyle = .fullScreen
        
        self.present(secondViewController, animated: true)
    }
}

extension FirstViewController_Practice1_DelegatePattern: CountProtocol{
    
    func showCount() {
        self.stateLabel.text = hitCount >= 10 ? hitCount > 10 ? "아이콩 \(hitCount)번이나 눌렀넹~~" : "정확히 \(hitCount)번 눌렀잖아!!🫢" : "조금만 더 눌러봥 \(hitCount)번 눌렀어!!!"
        self.stateLabel.asColor(targetString: "\(hitCount)번", color: UIColor.red)
        
        self.nextBtn.setTitle( hitCount >= 10 ? "다시 시도하기" : "누르러 가기", for: .normal)
        self.nextBtn.backgroundColor = hitCount >= 10 ? UIColor.systemPink : UIColor.systemIndigo
    }
    
    func plusCount() {
        hitCount += 1
    }
}

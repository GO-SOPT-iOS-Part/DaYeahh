//
//  SecondViewController_Practice1.swift
//  GO_SOPT_Seminar_Assingment
//
//  Created by 김다예 on 2023/04/08.
//

import UIKit

class SecondViewController_Practice1: UIViewController {

    var hitCount:Int = 0
    var completionHandler: ((Int) -> (Void))?
    
    private let mainLabel = UILabel().then{
        $0.text = "횟수는?!"
        $0.font = .systemFont(ofSize: 15)
        $0.textColor = .blue
        $0.textAlignment = .center
    }
    
    private lazy var clickBtn = UIButton().then{
        $0.setTitle("눌러줘", for: .normal)
        $0.backgroundColor = .systemBlue
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16)
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(pushBtn),
                         for: .touchUpInside)
    }
    
    private lazy var priviousBtn = UIButton().then{
        $0.setTitle("이전으로..", for: .normal)
        $0.backgroundColor = .systemBlue
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16)
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(pushPriviousBtn),
                         for: .touchUpInside)
    }
    func dataBind(cnt: Int){
        hitCount = cnt
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setLayout()
    }

}
private extension SecondViewController_Practice1{
    
    func style() {
        
        view.backgroundColor = .white
    }
    func setLayout(){
        [mainLabel, clickBtn, priviousBtn].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        mainLabel.snp.makeConstraints{
            $0.leading.leading.equalToSuperview().offset(30)
            $0.trailing.trailing.equalToSuperview().offset(-30)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(48)
        }
        clickBtn.snp.makeConstraints{
            $0.top.equalTo(mainLabel.snp.bottom).offset(10)
            $0.leading.leading.equalToSuperview().offset(150)
            $0.trailing.trailing.equalToSuperview().offset(-150)
            $0.height.equalTo(48)
        }
        priviousBtn.snp.makeConstraints{
            $0.top.equalTo(clickBtn.snp.bottom).offset(10)
            $0.leading.leading.equalToSuperview().offset(150)
            $0.trailing.trailing.equalToSuperview().offset(-150)
            $0.height.equalTo(48)
        }

    }
    
    @objc
    func pushBtn() {
        self.clickBtn.animateButton()
        hitCount += 1
    }
    
    @objc
    func pushPriviousBtn() {
        if self.navigationController == nil {
            completionHandler?(hitCount)
            self.dismiss(animated: true, completion: nil)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
}

//
//  SecondViewController_Practice1.swift
//  GO_SOPT_Seminar_Assingment
//
//  Created by 김다예 on 2023/04/08.
//

import UIKit

class SecondViewController_Practice1_HandlerProperty: UIViewController {

    var hitCount:Int = 0
    var completionHandler: ((Int) -> (Void))?

    private lazy var clickBtn = UIButton().then{
        $0.setTitle("Hit!!", for: .normal)
        $0.backgroundColor = .systemIndigo
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 20)
        $0.layer.cornerRadius = 20
        $0.addTarget(self, action: #selector(pushBtn),
                         for: .touchUpInside)
    }
    
    private lazy var priviousBtn = UIButton().then{
        $0.setTitle("< 몇 번 눌렀는지 보러가기", for: .normal)
        $0.backgroundColor = .systemGray6
        $0.setTitleColor(.darkGray, for: .normal)
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
private extension SecondViewController_Practice1_HandlerProperty{
    
    func style() {
        
        view.backgroundColor = .white
    }
    func setLayout(){
        
        view.addSubviews(clickBtn, priviousBtn)
        
        clickBtn.snp.makeConstraints{
            $0.leading.leading.equalToSuperview().offset(150)
            $0.trailing.trailing.equalToSuperview().offset(-150)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(48)
        }
        priviousBtn.snp.makeConstraints{
            $0.top.equalTo(clickBtn.snp.bottom).offset(30)
            $0.leading.leading.equalToSuperview().offset(80)
            $0.trailing.trailing.equalToSuperview().offset(-80)
            $0.height.equalTo(32)
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

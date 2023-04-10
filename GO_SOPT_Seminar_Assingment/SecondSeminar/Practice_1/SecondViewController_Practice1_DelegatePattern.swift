//
//  SecondViewController_Practice1_DelegatePattern.swift
//  GO_SOPT_Seminar_Assingment
//
//  Created by 김다예 on 2023/04/10.
//

import UIKit

protocol CountProtocol: AnyObject{
    func showCount()
    func plusCount()
}

class SecondViewController_Practice1_DelegatePattern: UIViewController {

    weak var delegate: CountProtocol?

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        setLayout()
    }
}

private extension SecondViewController_Practice1_DelegatePattern{
    
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
        delegate?.plusCount()
    }
    
    @objc
    func pushPriviousBtn() {
        
        if self.navigationController == nil {
            delegate?.showCount()
            self.dismiss(animated: true, completion: nil)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
}

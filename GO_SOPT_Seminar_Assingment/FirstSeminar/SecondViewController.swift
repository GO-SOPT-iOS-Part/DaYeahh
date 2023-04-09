//
//  SecondViewController.swift
//  SOPT first_project
//
//  Created by 김다예 on 2023/04/01.
//

import UIKit

class SecondViewController: UIViewController {

    public var name: String?

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "제 이름은요!"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("뒤로가기", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.addTarget(self,
                         action: #selector(backButtonTapped),
                         for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        setLayout()
        dataBind()
    }

    @objc
    func backButtonTapped() {
        
        // (navigationController가 없으면 modal이니까 dismiss)
        if self.navigationController == nil {
            self.dismiss(animated: true, completion: nil)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
//    func dataBind(name: String) {
//        nameLabel.text = name
//    }
    public func dataBind() {
        nameLabel.text = name
    }
}
private extension SecondViewController {
    
    func style() {
        
        view.backgroundColor = .white
    }
    
    func setLayout() {
        
        view.addSubviews(nameLabel, backButton)
        
        NSLayoutConstraint.activate([nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
    
        
        NSLayoutConstraint.activate([backButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
                                     backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     backButton.heightAnchor.constraint(equalToConstant: 48)])
    }
}

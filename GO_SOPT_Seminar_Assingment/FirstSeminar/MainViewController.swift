//
//  MainViewController.swift
//  SOPT first_project
//
//  Created by 김다예 on 2023/04/01.
//

import UIKit

class MainViewController: UIViewController {

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "이름이 무엇인가요???????"
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }()
    
    private let nameLabelEx: UILabel = {
        let label = UILabel()
        label.text = "ex) 김아요"
        label.font = .systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()
    
    private lazy var presentButton: UIButton = {
        let button = UIButton()
        button.setTitle("present!", for: .normal)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self,
                         action: #selector(presentButtonTapped),
                         for: .touchUpInside)
        return button
    }()
    
    private lazy var pushButton: UIButton = {
        let button = UIButton()
        button.setTitle("push!", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self,
                         action: #selector(pushToSecondViewController),
                         for: .touchUpInside)
        return button
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이 곳에 이름을 입력해주세요"
        textField.textAlignment = .center
        textField.clearButtonMode = .whileEditing
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        return textField
    }()
    
    private let imageExView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sopt.png")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    func presentToSecondViewController() {
        
        // modal
        guard let name = nameTextField.text else { return }
        let secondViewController = SecondViewController()
        secondViewController.modalPresentationStyle = .fullScreen
        secondViewController.name = name
        self.present(secondViewController, animated: true)
    }
    
    @objc
    func pushToSecondViewController() {
        
        // navigationController
        guard let name = nameTextField.text else { return }
        let secondViewController = SecondViewController()
        // 첫 번째는 함수의 매개변수로 전달, 두 번째는 바로 전달
//        secondViewController.dataBind(name: name)
        secondViewController.name = name
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    @objc
    func presentButtonTapped() {
        
        presentToSecondViewController()
    }
    
    @objc
    func pushButtonTapped() {
        
        pushToSecondViewController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        setLayout()

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    

}

// MARK: Layout
private extension MainViewController {
    
    func style() {
        
        view.backgroundColor = .white
    }
    
    func setLayout() {
        
        [imageExView, nameLabel, nameLabelEx, nameTextField,
         presentButton, pushButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        NSLayoutConstraint.activate([imageExView.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
                                     imageExView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150),
                                     imageExView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -150),
                                     imageExView.heightAnchor.constraint(equalToConstant: 52)])
        
        NSLayoutConstraint.activate([nameLabel.topAnchor.constraint(equalTo: imageExView.bottomAnchor, constant: 15),
                                     nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
        
        NSLayoutConstraint.activate([nameLabelEx.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
                                     nameLabelEx.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameLabelEx.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
        
        NSLayoutConstraint.activate([nameTextField.topAnchor.constraint(equalTo: nameLabelEx.bottomAnchor, constant: 15),
                                     nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     nameTextField.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([presentButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
                                     presentButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     presentButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     presentButton.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([pushButton.topAnchor.constraint(equalTo: presentButton.bottomAnchor, constant: 20),
                                     pushButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     pushButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     pushButton.heightAnchor.constraint(equalToConstant: 48)])
    }
}

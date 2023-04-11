//
//  ViewController.swift
//  GO_SOPT_Seminar_Assingment
//
//  Created by 김다예 on 2023/04/08.
//


import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    
    private let width_view = UIScreen.main.bounds.width / 2
    private let height_view = UIScreen.main.bounds.height / 4

    private let yellowView = UIView().then{
        $0.backgroundColor = .systemYellow
    }
    private let greenView = UIView().then{
        $0.backgroundColor = .systemGreen
    }
    private let blackView = UIView().then{
        $0.backgroundColor = .black
    }
    private let blueView = UIView().then{
        $0.backgroundColor = .systemBlue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setLayout()
    }
    

}

private extension ViewController{
    
    func style() {
        view.backgroundColor = .white
    }
    func setLayout(){
        [yellowView, greenView, blackView, blueView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        yellowView.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview()
            $0.width.equalTo(width_view)
            $0.height.equalTo(height_view)
        }
        greenView.snp.makeConstraints{
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview().offset(height_view)
            $0.width.equalTo(width_view)
            $0.height.equalTo(height_view)
        }
        blackView.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-height_view)
            $0.width.equalTo(width_view)
            $0.height.equalTo(height_view)
        }
        blueView.snp.makeConstraints{
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.width.equalTo(width_view)
            $0.height.equalTo(height_view)
        }

    }
}

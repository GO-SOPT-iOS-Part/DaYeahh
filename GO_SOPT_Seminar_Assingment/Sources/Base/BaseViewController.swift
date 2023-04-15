//
//  BaseViewController.swift
//  GO_SOPT_Seminar_Assingment
//
//  Created by 김다예 on 2023/04/16.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Property
    
    // MARK: - Lift Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        hierarchy()
        setLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func style() {

    }
    
    func hierarchy() {
        
    }
    
    func setLayout() {
        
    }
    
}

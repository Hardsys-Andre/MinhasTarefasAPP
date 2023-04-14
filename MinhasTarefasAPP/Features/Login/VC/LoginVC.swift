//
//  LoginVC.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 4/14/23.
//

import UIKit

class LoginVC: UIViewController {
    
    private var screen: LoginScreen?
    
    override func loadView() {
        screen = LoginScreen()
        screen?.delegate(delegate: self)
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

}
extension LoginVC: LoginScreenProtocol {
    
    func tappedEnterButton() {
        print(#function)
        let vc = TabBarController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    func tappedCadastroButton() {
        print(#function)
        let vc = CadastroVC()
        present(vc, animated: true)
    }
    
}


//
//  LoginVC.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 4/14/23.
//

import UIKit

class LoginVC: UIViewController {
    
    private var screen: LoginScreen?
    private var viewModel: LoginViewModel = LoginViewModel()
    private var alert: Alert?
    
    override func loadView() {
        screen = LoginScreen()
        alert = Alert(controller: self)
        screen?.delegate(delegate: self)
        viewModel.delegate(delegate: self)
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

}
extension LoginVC: LoginScreenProtocol {
    
    func tappedEnterButton() {
        viewModel.loginUser(email: screen?.emailTextField.text ?? "", password: screen?.passwordTextField.text ?? "")
    }
    
    func tappedCadastroButton() {
        print(#function)
        let vc = CadastroVC()
        present(vc, animated: true)
    }
    
}

extension LoginVC: LoginViewModelProtocol {
    func sucessLogin() {
        let vc = TabBarController()
        screen?.emailTextField.text = ""
        screen?.passwordTextField.text = ""
        
        
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    func errorLogin(errorMessage: String) {
        alert?.alert(title: "Ops Erro no Login", message: errorMessage)
    }
    
    
}


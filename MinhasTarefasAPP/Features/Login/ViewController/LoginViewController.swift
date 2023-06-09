//
//  LoginVC.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 4/14/23.
//

import UIKit

protocol LoginDelegate: AnyObject{
    func emailLogado(email: String)
}

class LoginViewController: UIViewController {
    
    weak var delegate: LoginDelegate?
    func delegate(delegate: LoginDelegate?){
        self.delegate = delegate
    }
    func loginSucess(email: String){
        delegate?.emailLogado(email: email)
    }
    
    public var loginView: LoginView?
    private var viewModel: LoginViewModel = LoginViewModel()
    private var alert: Alert?
    
    override func loadView() {
        loginView = LoginView()
        alert = Alert(controller: self)
        loginView?.delegate(delegate: self)
        viewModel.delegate(delegate: self)
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
extension LoginViewController: LoginViewProtocol {
    
    func tappedEnterButton() {
        viewModel.loginUser(email: loginView?.emailTextField.text ?? "", password: loginView?.passwordTextField.text ?? "")
    }
    
    func tappedCadastroButton() {
        let cadastroViewController = CadastroViewController()
        navigationController?.pushViewController(cadastroViewController, animated: true)
        //vc.modalPresentationStyle = .fullScreen
        //present(vc, animated: true)
    }
}

extension LoginViewController: LoginViewModelProtocol {
    func loginSuccess() {
        let tabBarController = TabBarController()
        loginView?.emailTextField.text = ""
        loginView?.passwordTextField.text = ""
        navigationController?.pushViewController(tabBarController, animated: true)
        //tabBarController.modalPresentationStyle = .fullScreen
        //present(tabBarController, animated: true)
    }
    
    func loginFailure(message: String?) {
        alert?.alert(title: "Atenção Erro no Login", message: message ?? "")
    }
}

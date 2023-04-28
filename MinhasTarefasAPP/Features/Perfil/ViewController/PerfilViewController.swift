//
//  PerfilViewController.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 4/27/23.
//

import UIKit
import Firebase
import SDWebImage

class PerfilViewController: UIViewController {
    
    private var perfilView: PerfilVIew?
    private var perfilViewModel: PerfilViewModel?
    private var userSearchData: [DocumentSnapshot] = []
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        perfilViewModel?.delegate(delegate: self)
        perfilView?.delegate(delegate: self)
    }
    
    override func loadView() {
        perfilViewModel = PerfilViewModel()
        perfilView = PerfilVIew()
        
        view = perfilView
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        perfilViewModel?.searchUser(email: "Tibia@gmail.com")
        print(self.userSearchData)
    }
    
}
extension PerfilViewController: perfilViewModelProtocol {
    func userSearchData(data: [DocumentSnapshot]) {
        userSearchData = data
        let user = userSearchData.first?.data()
        if let imageUrl = user?["image"] as? String {
            self.perfilView?.userLogadoImageView.sd_setImage(with: URL(string: imageUrl))
        }else{
            print("Falha na extração da URL")
        }
        perfilView?.nameTextField.text = user?["name"] as? String
        perfilView?.lastNameTextField.text = user?["lastName"] as? String
        perfilView?.ufTextField.text = user?["uf"] as? String
        perfilView?.cityTextField.text = user?["city"] as? String
        perfilView?.emailTextField.text = user?["email"] as? String
            
    }
}
extension PerfilViewController: PerfilViewProtocol {
    func tappedLogoutApp() {
        
        let windows = UIApplication.shared.windows
           windows.forEach { $0.isHidden = true }

           // Fazer logout do usuário (ou realizar outras ações de logout, se necessário)
           // ...

           // Abrir a tela de login
           let loginViewController = LoginViewController()
        let window = UIApplication.shared.windows.first
        window?.rootViewController = loginViewController
        window?.makeKeyAndVisible()

    }
    
    
}

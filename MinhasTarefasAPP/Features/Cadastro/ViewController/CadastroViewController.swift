//
//  CadastroVC.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 4/14/23.
//

import UIKit

class CadastroViewController: UIViewController {
    
    private var screen: CadastroView?
    private var alert: Alert?
    private var alertPop: AlertPop?
    private var viewModel: CadastroViewModel = CadastroViewModel()
    private var loadingViewController = LoadingViewController()
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func loadView() {
        screen = CadastroView()
        screen?.delegate(delegate: self)
        alert = Alert(controller: self)
        alertPop = AlertPop(controller: self)
        viewModel.delegate(delegate: self)
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func encerrarTelaDeCarregamento() {
        loadingViewController.activityIndicator.stopAnimating()
            dismiss(animated: true, completion: nil)
        }
}

extension CadastroViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func showImagePicker(){
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            screen?.userImageView.image = selectedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
}

extension CadastroViewController: CadastroViewProtocol {
    func tappedUserImage() {
        showImagePicker()
    }
    
    func tappedBackImage() {
        navigationController?.popViewController(animated: true)
    }
    
    func tappedCadastrarButton() {
        
        if (screen?.nameTextField.text == "") ||
            (screen?.lastNameTextField.text == "") ||
            (screen?.ufTextField.text == "") ||
            (screen?.cityTextField.text == "") ||
            (screen?.emailTextField.text == "") ||
            (screen?.passwordTextField.text == ""){
            alert?.alert(title: "Atenção", message: "Preencha todos os campos antes de prosseguir")
        }else{
            present(loadingViewController, animated: true)
            
            viewModel.cadastroUser(email: screen?.emailTextField.text ?? "", password: screen?.passwordTextField.text ?? "", name: screen?.nameTextField.text ?? "", lastName: screen?.lastNameTextField.text ?? "", uf: screen?.ufTextField.text ?? "", city: screen?.cityTextField.text ?? "", imageUser: screen?.userImageView.image ?? UIImage())
        }
    }
}
extension CadastroViewController: CadastroViewModelProtocol {
    func sucessCadastro() {
        self.encerrarTelaDeCarregamento()
        alertPop?.alertPop(title: "Parabéns", message: "Cadastro realizado com sucesso")
        
    }
    
    func errorCadastro(errorMessage: String) {
        self.encerrarTelaDeCarregamento()
        alert?.alert(title: "Atenção Erro no Cadastro", message: errorMessage)
        
    }
}

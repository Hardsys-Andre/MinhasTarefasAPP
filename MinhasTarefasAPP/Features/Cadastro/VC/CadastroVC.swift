//
//  CadastroVC.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 4/14/23.
//

import UIKit

class CadastroVC: UIViewController {
    
    private var screen: CadastroScreen?
    private var alert: Alert?
    private var alertPop: AlertPop?
    private var viewModel: CadastroViewModel = CadastroViewModel()
    
    
    override func loadView() {
        screen = CadastroScreen()
        screen?.delegate(delegate: self)
        alert = Alert(controller: self)
        alertPop = AlertPop(controller: self)
        viewModel.delegate(delegate: self)
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
}

extension CadastroVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func showImagePicker(){
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            // define a imagem selecionada na UIImageView
            screen?.userImageView.image = selectedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
}

extension CadastroVC: CadastroScreenProtocol {
    func tappedUserImage() {
        showImagePicker()
    }
    
    func tappedBackImage() {
        dismiss(animated: true)
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
            viewModel.cadastroUser(email: screen?.emailTextField.text ?? "", password: screen?.passwordTextField.text ?? "", nome: screen?.nameTextField.text ?? "", sobrenome: screen?.lastNameTextField.text ?? "", uf: screen?.ufTextField.text ?? "", cidade: screen?.cityTextField.text ?? "", imageUser: screen?.userImageView.image ?? UIImage())
        }
    }
}
extension CadastroVC: CadastroViewModelProtocol {
    func sucessCadastro() {
        alertPop?.alertPop(title: "Parabéns", message: "Cadastro realizado com sucesso")
    }
    
    func errorCadastro(errorMessage: String) {
        alert?.alert(title: "Ops Erro no Cadastro", message: errorMessage)
    }
    
    
}

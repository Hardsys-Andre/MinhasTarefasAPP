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
    
    private var viewModel: PerfilViewModel?
    
    private var loadingViewController = LoadingViewController()
    
    private var alert: Alert?
    
    init(viewModel: PerfilViewModel){
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        alert = Alert(controller: self)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        perfilView?.delegate(delegate: self)
        
        if let imageUrl = viewModel?.userData?.imageUrl {
            self.perfilView?.userLogadoImageView.sd_setImage(with: URL(string: imageUrl))
        }else{
            alert?.alert(title: "Atenção", message: "Falha na extração da imagem")
        }
        perfilView?.nameTextField.text = viewModel?.userData?.name
        perfilView?.lastNameTextField.text = viewModel?.userData?.lastName
        perfilView?.ufTextField.text = viewModel?.userData?.uf
        perfilView?.cityTextField.text = viewModel?.userData?.city
        perfilView?.emailTextField.text = viewModel?.userData?.email
    }
    
    override func loadView() {
        perfilView = PerfilVIew()
        view = perfilView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.delegate(delegate: self)
    }
    func encerrarTelaDeCarregamento() {
        loadingViewController.activityIndicator.stopAnimating()
            dismiss(animated: true, completion: nil)
        }
}

extension PerfilViewController: PerfilViewProtocol {
    func tappedImagePicker() {
        showImagePicker()
    }
    
    func tappedSalvar() {
        present(loadingViewController, animated: true)
        
        viewModel?.updateUserData(name: perfilView?.nameTextField.text ?? "",
                                  lastName: perfilView?.lastNameTextField.text ?? "",
                                  uf: perfilView?.ufTextField.text ?? "",
                                  city: perfilView?.cityTextField.text ?? "",
                                  imageUser: perfilView?.userLogadoImageView.image ?? UIImage())
    }
    func tappedLogoutApp() {
        
        let windows = UIApplication.shared.windows
        windows.forEach { $0.isHidden = true }
        
        let loginViewController = LoginViewController()
        let window = UIApplication.shared.windows.first
        window?.rootViewController = loginViewController
        window?.makeKeyAndVisible()
    }
}
extension PerfilViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func showImagePicker(){
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            perfilView?.userLogadoImageView.image = selectedImage
            viewModel?.imageHasChanged = true
        }
        picker.dismiss(animated: true, completion: nil)
    }
}
extension PerfilViewController: PerfilViewModelProtocol {
    func successUpdate() {
        self.encerrarTelaDeCarregamento()
        alert?.alert(title: "Atenção", message: "Alterações feitas com sucesso")
    }
    func errorUpdate(message: String) {
        self.encerrarTelaDeCarregamento()
        alert?.alert(title: "Atenção Error", message: message)
    }
}

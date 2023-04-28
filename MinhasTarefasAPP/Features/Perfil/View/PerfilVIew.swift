//
//  PerfilVIew.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 4/27/23.
//

import UIKit

protocol PerfilViewProtocol: AnyObject {
    func tappedLogoutApp()
}

class PerfilVIew: UIView {
    
    private weak var delegate: PerfilViewProtocol?
    public func delegate(delegate: PerfilViewProtocol?){
        self.delegate = delegate
    }
    
    lazy var exitLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sair"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.clipsToBounds = true
        label.layer.cornerRadius = 8
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.white.cgColor
        label.textAlignment = .center
        label.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedLogoutApp))
        label.addGestureRecognizer(tapGesture)
        
        return label
    }()
    @objc func tappedLogoutApp(){
        self.delegate?.tappedLogoutApp()
    }
    
    lazy var nameUserLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Usuário Logado"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var userLogadoImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "user_Image")
        image.contentMode = .scaleAspectFill
        image.isUserInteractionEnabled = true
        image.clipsToBounds = true
        image.layer.cornerRadius = 80
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedUserImage))
        image.addGestureRecognizer(tapGesture)
        return image
    }()
    @objc func tappedUserImage(){
        print(#function)
    }
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nome"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        return label
    }()
    
    lazy var nameTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .gray
        tf.borderStyle = .roundedRect
        tf.attributedPlaceholder = NSAttributedString(string: "Digite seu Nome", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
        tf.textColor = .white
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 10
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        
        return tf
    }()
    lazy var lastNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sobrenome"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        return label
    }()
    
    lazy var lastNameTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .gray
        tf.borderStyle = .roundedRect
        tf.attributedPlaceholder = NSAttributedString(string: "Digite seu Sobrenome", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
        tf.textColor = .white
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 10
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        
        return tf
    }()
    
    lazy var ufLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Estado"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        return label
    }()
    
    lazy var ufTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .gray
        tf.borderStyle = .roundedRect
        tf.attributedPlaceholder = NSAttributedString(string: "UF", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
        tf.textColor = .white
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 10
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        
        return tf
    }()
    
    lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Cidade"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        return label
    }()
    
    lazy var cityTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .gray
        tf.borderStyle = .roundedRect
        tf.attributedPlaceholder = NSAttributedString(string: "Escolha sua Cidade", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
        tf.textColor = .white
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 10
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        
        return tf
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .gray
        tf.borderStyle = .roundedRect
        tf.attributedPlaceholder = NSAttributedString(string: "Digite seu Email", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
        tf.textColor = .white
        tf.keyboardType = .emailAddress
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 10
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        
        return tf
    }()
    
    lazy var editarCadastroButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Editar Cadastro", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = .red
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.tintColor = .white
        button.addTarget(self, action: #selector(tappedEditarCadastroButton), for: .touchUpInside)
        
        return button
    }()
    @objc func tappedEditarCadastroButton(){
        print(#function)
    }
    
    lazy var salvarAlteracaoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Salvar Alterações", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = .white
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.tintColor = .white
        button.addTarget(self, action: #selector(tappedCadastrarButton), for: .touchUpInside)
        
        return button
    }()
    @objc func tappedCadastrarButton(){
        print(#function)
    }
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        configElements()
        configConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configElements(){
        addSubview(exitLabel)
        addSubview(nameUserLabel)
        addSubview(userLogadoImageView)
        addSubview(nameLabel)
        addSubview(nameTextField)
        addSubview(lastNameLabel)
        addSubview(lastNameTextField)
        addSubview(ufLabel)
        addSubview(ufTextField)
        addSubview(cityLabel)
        addSubview(cityTextField)
        addSubview(emailLabel)
        addSubview(emailTextField)
        addSubview(editarCadastroButton)
        addSubview(salvarAlteracaoButton)
    }
    private func configConstraints(){
        NSLayoutConstraint.activate([
            exitLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 2),
            exitLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            exitLabel.heightAnchor.constraint(equalToConstant: 50),
            exitLabel.widthAnchor.constraint(equalToConstant: 50),
            
            nameUserLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            nameUserLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameUserLabel.heightAnchor.constraint(equalToConstant: 35),
            
            userLogadoImageView.topAnchor.constraint(equalTo: nameUserLabel.bottomAnchor, constant: 10),
            userLogadoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            userLogadoImageView.heightAnchor.constraint(equalToConstant: 160),
            userLogadoImageView.widthAnchor.constraint(equalToConstant: 160),
            
            nameLabel.topAnchor.constraint(equalTo: userLogadoImageView.bottomAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            nameLabel.heightAnchor.constraint(equalToConstant: 35),
            
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2),
            nameTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            nameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            lastNameLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 2),
            lastNameLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            lastNameLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            lastNameLabel.heightAnchor.constraint(equalToConstant: 35),
            
            lastNameTextField.topAnchor.constraint(equalTo: lastNameLabel.bottomAnchor, constant: 2),
            lastNameTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            lastNameTextField.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            lastNameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            ufLabel.topAnchor.constraint(equalTo: lastNameTextField.bottomAnchor, constant: 2),
            ufLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            ufLabel.widthAnchor.constraint(equalToConstant: 80),
            ufLabel.heightAnchor.constraint(equalToConstant: 35),
            
            ufTextField.topAnchor.constraint(equalTo: ufLabel.bottomAnchor, constant: 2),
            ufTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            ufTextField.widthAnchor.constraint(equalToConstant: 80),
            ufTextField.heightAnchor.constraint(equalToConstant: 40),
            
            cityLabel.topAnchor.constraint(equalTo: lastNameTextField.bottomAnchor, constant: 2),
            cityLabel.leadingAnchor.constraint(equalTo: ufLabel.trailingAnchor, constant: 4),
            cityLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            cityLabel.heightAnchor.constraint(equalToConstant: 35),
            
            cityTextField.topAnchor.constraint(equalTo: ufLabel.bottomAnchor, constant: 2),
            cityTextField.leadingAnchor.constraint(equalTo: ufTextField.trailingAnchor, constant: 4),
            cityTextField.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            cityTextField.heightAnchor.constraint(equalToConstant: 40),
            
            emailLabel.topAnchor.constraint(equalTo: ufTextField.bottomAnchor, constant: 2),
            emailLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            emailLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            emailLabel.heightAnchor.constraint(equalToConstant: 35),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 2),
            emailTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            editarCadastroButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            editarCadastroButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            editarCadastroButton.heightAnchor.constraint(equalToConstant: 40),
            editarCadastroButton.widthAnchor.constraint(equalToConstant: 150),
            
            salvarAlteracaoButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            salvarAlteracaoButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            salvarAlteracaoButton.heightAnchor.constraint(equalToConstant: 40),
            salvarAlteracaoButton.widthAnchor.constraint(equalToConstant: 160),
        ])
        
    }
}

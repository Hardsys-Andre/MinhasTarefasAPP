//
//  CadastroScreen.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 4/14/23.
//

import UIKit

protocol CadastroViewProtocol: AnyObject {
    func tappedCadastrarButton()
    func tappedBackImage()
    func tappedUserImage()
}

class CadastroView: UIView {
    
    private weak var delegate: CadastroViewProtocol?
    
    public func delegate(delegate: CadastroViewProtocol? ) {
        self.delegate = delegate
    }
    
    lazy var backImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Botao_Back")
        image.contentMode = .scaleAspectFill
        image.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedBackImage))
        image.addGestureRecognizer(tapGesture)
        return image
    }()
    @objc func tappedBackImage(){
        self.delegate?.tappedBackImage()
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Cadastre seu Usuário"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        return label
    }()
    
    lazy var userImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "galery_cam")
        image.contentMode = .scaleAspectFill
        image.isUserInteractionEnabled = true
        image.clipsToBounds = true
        image.layer.cornerRadius = 80
        image.layer.borderWidth = 2
        image.layer.borderColor = UIColor.white.cgColor
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedUserImage))
        image.addGestureRecognizer(tapGesture)
        return image
    }()
    @objc func tappedUserImage(){
        self.delegate?.tappedUserImage()
    }
    
    lazy var fotoUserLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Escolha sua Foto"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Primeiro Nome"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    lazy var nameTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.attributedPlaceholder = NSAttributedString(string: "Digite seu primeiro Nome", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
        tf.textColor = .black
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
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.attributedPlaceholder = NSAttributedString(string: "Digite seu Sobrenome", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
        tf.textColor = .black
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
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.attributedPlaceholder = NSAttributedString(string: "UF", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
        tf.autocapitalizationType = .allCharacters
        tf.textColor = .black
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
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.attributedPlaceholder = NSAttributedString(string: "Escolha sua Cidade", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
        tf.textColor = .black
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
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.attributedPlaceholder = NSAttributedString(string: "Digite seu Email", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
        tf.autocapitalizationType = .none
        tf.textColor = .black
        tf.keyboardType = .emailAddress
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 10
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        return tf
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Senha"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.attributedPlaceholder = NSAttributedString(string: "Digite sua Senha", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
        tf.textColor = .black
        tf.isSecureTextEntry = true
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 10
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        return tf
    }()
    
    lazy var cadastrarButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = .white
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(tappedCadastrarButton), for: .touchUpInside)
        return button
    }()
    @objc func tappedCadastrarButton(){
        self.delegate?.tappedCadastrarButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 67/255, green: 154/255, blue: 224/255, alpha: 1)
        configElements()
        configConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configElements(){
        addSubview(backImageView)
        addSubview(titleLabel)
        addSubview(userImageView)
        addSubview(fotoUserLabel)
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
        addSubview(passwordLabel)
        addSubview(passwordTextField)
        addSubview(cadastrarButton)
    }
    private func configConstraints(){
        NSLayoutConstraint.activate([
            backImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            backImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            backImageView.heightAnchor.constraint(equalToConstant: 30),
            backImageView.widthAnchor.constraint(equalToConstant: 30),
            
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 25),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 35),
            
            userImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
            userImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            userImageView.heightAnchor.constraint(equalToConstant: 160),
            userImageView.widthAnchor.constraint(equalToConstant: 160),
            
            fotoUserLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 10),
            fotoUserLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            fotoUserLabel.heightAnchor.constraint(equalToConstant: 30),
            
            nameLabel.topAnchor.constraint(equalTo: fotoUserLabel.bottomAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
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
            
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 2),
            passwordLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            passwordLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            passwordLabel.heightAnchor.constraint(equalToConstant: 35),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 2),
            passwordTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            cadastrarButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            cadastrarButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            cadastrarButton.heightAnchor.constraint(equalToConstant: 40),
            cadastrarButton.widthAnchor.constraint(equalToConstant: 120),
        ])
    }
}

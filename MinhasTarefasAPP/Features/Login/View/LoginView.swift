//
//  LoginScreen.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 4/14/23.
//

import UIKit

protocol LoginViewProtocol: AnyObject {
    func tappedEnterButton()
    func tappedCadastroButton()
}

class LoginView: UIView {
    
    private weak var delegate: LoginViewProtocol?
    
    public func delegate(delegate: LoginViewProtocol?){
        self.delegate = delegate
    }
    
    lazy var logoImageVIew: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo_inicial")
        image.contentMode = .scaleAspectFill
        
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Organize seu dia"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
       
        return label
    }()
    
    lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Cadastre suas tarefas e compromissos"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
       
        return label
    }()
    
    lazy var loginTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Faça o Login"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
       
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 24)
        textField.textColor = .white
        textField.keyboardType = .emailAddress
        textField.backgroundColor = .gray
        textField.attributedPlaceholder = NSAttributedString(string: "Digite seu Email", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
        textField.clipsToBounds = true
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.white.cgColor
        textField.layer.cornerRadius = 10
        textField.autocorrectionType = .no
        textField.borderStyle = .roundedRect
        
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 24)
        textField.textColor = .white
        textField.isSecureTextEntry = true
        textField.backgroundColor = .gray
        textField.attributedPlaceholder = NSAttributedString(string: "Digite sua senha", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
        textField.clipsToBounds = true
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.white.cgColor
        textField.layer.cornerRadius = 10
        textField.autocorrectionType = .no
        textField.borderStyle = .roundedRect

        
        return textField
    }()
    
    lazy var enterButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.setTitle("Entrar", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(tappedEnterButton), for: .touchUpInside)
        
        return button
    }()
    
    @objc func tappedEnterButton(){
        self.delegate?.tappedEnterButton()
    }
    
    lazy var oneLineview: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        return view
        
    }()
    lazy var twoLineview: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        return view
        
    }()
    lazy var threeLineview: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        return view
        
    }()
    
    lazy var fourLineview: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        return view
        
    }()
    
    lazy var cadastroButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.tintColor = .white
        button.setTitle("Cadastre-se aqui!", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(tappedCadastroButton), for: .touchUpInside)
        
        return button
    }()
    
    @objc func tappedCadastroButton(){
        self.delegate?.tappedCadastroButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        configElements()
        configConstraints()
        emailTextField.text = "Tibia@gmail.com"
        passwordTextField.text = "123456"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configElements(){
        addSubview(logoImageVIew)
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        addSubview(loginTitleLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(enterButton)
        addSubview(oneLineview)
        addSubview(twoLineview)
        addSubview(threeLineview)
        addSubview(fourLineview)
        addSubview(cadastroButton)
    }
    private func configConstraints(){
        NSLayoutConstraint.activate([
            logoImageVIew.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            logoImageVIew.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageVIew.heightAnchor.constraint(equalToConstant: 200),
            logoImageVIew.widthAnchor.constraint(equalToConstant: 200),
            
            titleLabel.topAnchor.constraint(equalTo: logoImageVIew.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            subTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subTitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            loginTitleLabel.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 20),
            loginTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            loginTitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: loginTitleLabel.bottomAnchor, constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            emailTextField.heightAnchor.constraint(equalToConstant: 45),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 45),
            
            enterButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            enterButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            enterButton.heightAnchor.constraint(equalToConstant: 45),
            enterButton.widthAnchor.constraint(equalToConstant: 200),
            
            oneLineview.topAnchor.constraint(equalTo: enterButton.bottomAnchor, constant: 15),
            oneLineview.centerXAnchor.constraint(equalTo: centerXAnchor),
            oneLineview.heightAnchor.constraint(equalToConstant: 3),
            oneLineview.widthAnchor.constraint(equalToConstant: 180),
            
            twoLineview.topAnchor.constraint(equalTo: oneLineview.bottomAnchor, constant: 10),
            twoLineview.centerXAnchor.constraint(equalTo: centerXAnchor),
            twoLineview.heightAnchor.constraint(equalToConstant: 3),
            twoLineview.widthAnchor.constraint(equalToConstant: 100),

            threeLineview.topAnchor.constraint(equalTo: twoLineview.bottomAnchor, constant: 10),
            threeLineview.centerXAnchor.constraint(equalTo: centerXAnchor),
            threeLineview.heightAnchor.constraint(equalToConstant: 3),
            threeLineview.widthAnchor.constraint(equalToConstant: 50),
            
            fourLineview.topAnchor.constraint(equalTo: threeLineview.bottomAnchor, constant: 10),
            fourLineview.centerXAnchor.constraint(equalTo: centerXAnchor),
            fourLineview.heightAnchor.constraint(equalToConstant: 3),
            fourLineview.widthAnchor.constraint(equalToConstant: 20),
            
            cadastroButton.topAnchor.constraint(equalTo: fourLineview.bottomAnchor, constant: 10),
            cadastroButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            cadastroButton.heightAnchor.constraint(equalToConstant: 30),
            cadastroButton.widthAnchor.constraint(equalToConstant: 180),
        ])
    }
    
}

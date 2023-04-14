//
//  AddTarefasCollectionViewCellScreen.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 4/14/23.
//

import UIKit

class AddTarefasCollectionViewCellScreen: UIView {
    
    lazy var trabalhoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.setTitle("Trabalho", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.titleLabel?.textColor = .white
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        //button.addTarget(self, action: #selector(tappedCloseButton), for: .touchUpInside)
        
        return button
    }()
    
    lazy var EscolaButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.setTitle("Escola", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.titleLabel?.textColor = .white
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        //button.addTarget(self, action: #selector(tappedCloseButton), for: .touchUpInside)
        
        return button
    }()
    
    lazy var lazerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .orange
        button.setTitle("Lazer/Esportes", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.titleLabel?.textColor = .white
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        //button.addTarget(self, action: #selector(tappedCloseButton), for: .touchUpInside)
        
        return button
    }()
    
    lazy var saudeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .green
        button.setTitle("Saúde", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.titleLabel?.textColor = .white
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        //button.addTarget(self, action: #selector(tappedCloseButton), for: .touchUpInside)
        
        return button
    }()
    lazy var alimentacaoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .yellow
        button.setTitle("Alimentação", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.titleLabel?.textColor = .white
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        //button.addTarget(self, action: #selector(tappedCloseButton), for: .touchUpInside)
        
        return button
    }()
    lazy var domesticaButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .purple
        button.setTitle("Doméstica", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.titleLabel?.textColor = .white
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        //button.addTarget(self, action: #selector(tappedCloseButton), for: .touchUpInside)
        
        return button
    }()
    lazy var outrasButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemPink
        button.setTitle("Outras Categorias", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.titleLabel?.textColor = .white
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        //button.addTarget(self, action: #selector(tappedCloseButton), for: .touchUpInside)
        
        return button
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        configElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configElements(){
        addSubview(trabalhoButton)
        addSubview(EscolaButton)
        addSubview(lazerButton)
        addSubview(saudeButton)
        addSubview(alimentacaoButton)
        addSubview(domesticaButton)
        addSubview(outrasButton)
    }
    private func configConstraints(){
        NSLayoutConstraint.activate([
            trabalhoButton.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            trabalhoButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            trabalhoButton.heightAnchor.constraint(equalToConstant: 30),
            trabalhoButton.widthAnchor.constraint(equalToConstant: 120),
            
            EscolaButton.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            EscolaButton.leadingAnchor.constraint(equalTo: trabalhoButton.trailingAnchor, constant: 2),
            EscolaButton.heightAnchor.constraint(equalToConstant: 30),
            EscolaButton.widthAnchor.constraint(equalToConstant: 110),
            
            lazerButton.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            lazerButton.leadingAnchor.constraint(equalTo: EscolaButton.trailingAnchor, constant: 2),
            lazerButton.heightAnchor.constraint(equalToConstant: 30),
            lazerButton.widthAnchor.constraint(equalToConstant: 145),
            
            saudeButton.topAnchor.constraint(equalTo: lazerButton.bottomAnchor, constant: 5),
            saudeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            saudeButton.heightAnchor.constraint(equalToConstant: 30),
            saudeButton.widthAnchor.constraint(equalToConstant: 95),
            
            alimentacaoButton.topAnchor.constraint(equalTo: EscolaButton.bottomAnchor, constant: 5),
            alimentacaoButton.leadingAnchor.constraint(equalTo: saudeButton.trailingAnchor, constant: 2),
            alimentacaoButton.heightAnchor.constraint(equalToConstant: 30),
            alimentacaoButton.widthAnchor.constraint(equalToConstant: 145),
            
            domesticaButton.topAnchor.constraint(equalTo: lazerButton.bottomAnchor, constant: 5),
            domesticaButton.leadingAnchor.constraint(equalTo: alimentacaoButton.trailingAnchor, constant: 2),
            domesticaButton.heightAnchor.constraint(equalToConstant: 30),
            domesticaButton.widthAnchor.constraint(equalToConstant: 135),
            
            outrasButton.topAnchor.constraint(equalTo: domesticaButton.bottomAnchor, constant: 5),
            outrasButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            outrasButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -9),
            outrasButton.heightAnchor.constraint(equalToConstant: 30),
            
            
        ])
    }
    
}

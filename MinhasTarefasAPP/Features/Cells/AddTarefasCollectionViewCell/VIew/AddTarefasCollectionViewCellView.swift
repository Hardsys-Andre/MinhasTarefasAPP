//
//  AddTarefasCollectionViewCellScreen.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 4/14/23.
//

import UIKit

protocol AddTarefasCollectionViewCellViewProtocol: AnyObject {
    func tappedTrabalho()
    func tappedEscola()
    func tappedLazer()
    func tappedSaude()
    func tappedAlimentacao()
    func tappedDomestica()
    func tappedOutra()
}

class AddTarefasCollectionViewCellView: UIView {
    
    private weak var delegate: AddTarefasCollectionViewCellViewProtocol?
    public func delegate(delegate: AddTarefasCollectionViewCellViewProtocol?){
        self.delegate = delegate
    }
    
    lazy var trabalhoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.setTitle("Trabalho", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.titleLabel?.textColor = .white
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.addTarget(self, action: #selector(tappedTrabalho), for: .touchUpInside)
        
        return button
    }()
    
    @objc func tappedTrabalho(){
        self.delegate?.tappedTrabalho()
        
    }
    
    lazy var escolaButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.setTitle("Escola", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.titleLabel?.textColor = .white
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(tappedEscola), for: .touchUpInside)
        
        return button
    }()
    @objc func tappedEscola(){
        self.delegate?.tappedEscola()
    }
    
    lazy var lazerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .orange
        button.setTitle("Lazer/Esportes", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.titleLabel?.textColor = .white
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(tappedLazer), for: .touchUpInside)
        
        return button
    }()
    @objc func tappedLazer(){
        self.delegate?.tappedLazer()
    }
    
    lazy var saudeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .green
        button.setTitle("Saúde", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.titleLabel?.textColor = .white
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(tappedSaude), for: .touchUpInside)
        
        return button
    }()
    @objc func tappedSaude(){
        self.delegate?.tappedSaude()
    }
    
    lazy var alimentacaoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .yellow
        button.setTitle("Alimentação", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.titleLabel?.textColor = .white
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(tappedAlimentacao), for: .touchUpInside)
        
        return button
    }()
    @objc func tappedAlimentacao(){
        self.delegate?.tappedAlimentacao()
    }
    
    lazy var domesticaButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .purple
        button.setTitle("Doméstica", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.titleLabel?.textColor = .white
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(tappedDomestica), for: .touchUpInside)
        
        return button
    }()
    @objc func tappedDomestica(){
        self.delegate?.tappedDomestica()
    }
    
    lazy var outrasButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemPink
        button.setTitle("Outras Categorias", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.titleLabel?.textColor = .white
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(tappedOutra), for: .touchUpInside)
        
        return button
    }()
    @objc func tappedOutra(){
        self.delegate?.tappedOutra()
    }

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
        addSubview(escolaButton)
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
            
            escolaButton.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            escolaButton.leadingAnchor.constraint(equalTo: trabalhoButton.trailingAnchor, constant: 2),
            escolaButton.heightAnchor.constraint(equalToConstant: 30),
            escolaButton.widthAnchor.constraint(equalToConstant: 110),
            
            lazerButton.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            lazerButton.leadingAnchor.constraint(equalTo: escolaButton.trailingAnchor, constant: 2),
            lazerButton.heightAnchor.constraint(equalToConstant: 30),
            lazerButton.widthAnchor.constraint(equalToConstant: 145),
            
            saudeButton.topAnchor.constraint(equalTo: lazerButton.bottomAnchor, constant: 5),
            saudeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            saudeButton.heightAnchor.constraint(equalToConstant: 30),
            saudeButton.widthAnchor.constraint(equalToConstant: 95),
            
            alimentacaoButton.topAnchor.constraint(equalTo: escolaButton.bottomAnchor, constant: 5),
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

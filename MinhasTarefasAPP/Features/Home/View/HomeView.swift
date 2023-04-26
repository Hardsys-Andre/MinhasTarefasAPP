//
//  HomeScreen.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 4/14/23.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    func tappedCriarTarefaButton()
    func tappedBackImage()
}

class HomeView: UIView {
    
    private weak var delegate: HomeViewProtocol?
    
    public func delegate(delegate: HomeViewProtocol?){
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
        label.text = "Tarefas Cadastradas"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var userImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "user_Image")
        image.contentMode = .scaleAspectFill
        image.isUserInteractionEnabled = true
        image.clipsToBounds = true
        image.layer.cornerRadius = 50
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedUserImage))
        image.addGestureRecognizer(tapGesture)
        return image
    }()
    @objc func tappedUserImage(){
        //self.delegate?.tappedUserImage()
    }
    
    lazy var nameUserLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Usuário"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .black
        tableView.separatorStyle = .none
        tableView.register(TarefasCriadasTableViewCell.self, forCellReuseIdentifier: TarefasCriadasTableViewCell.identifier)
        return tableView
    }()
    func configTableViewProtocol(delegate: UITableViewDelegate, dataSource: UITableViewDataSource){
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSource
    }
    
    lazy var criarTarefaButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Criar Tarefa", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.clipsToBounds = true
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.tintColor = .white
        button.addTarget(self, action: #selector(tappedCriarTarefaButton), for: .touchUpInside)
        
        return button
    }()
    @objc func tappedCriarTarefaButton(){
        self.delegate?.tappedCriarTarefaButton()
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
        addSubview(backImageView)
        addSubview(titleLabel)
        addSubview(userImageView)
        addSubview(nameUserLabel)
        addSubview(tableView)
        addSubview(criarTarefaButton)
    }
    private func configConstraints(){
        NSLayoutConstraint.activate([
            backImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            backImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            backImageView.heightAnchor.constraint(equalToConstant: 30),
            backImageView.widthAnchor.constraint(equalToConstant: 30),
            
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            titleLabel.leadingAnchor.constraint(equalTo: backImageView.trailingAnchor, constant: 15),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            userImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            userImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            userImageView.heightAnchor.constraint(equalToConstant: 100),
            userImageView.widthAnchor.constraint(equalToConstant: 100),
            
            nameUserLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 0),
            nameUserLabel.centerXAnchor.constraint(equalTo: userImageView.centerXAnchor),
            nameUserLabel.heightAnchor.constraint(equalToConstant: 30),
            nameUserLabel.widthAnchor.constraint(equalToConstant: 150),
            
            tableView.topAnchor.constraint(equalTo: nameUserLabel.bottomAnchor, constant: 5),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.heightAnchor.constraint(equalToConstant: 500),
            
            criarTarefaButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 10),
            criarTarefaButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            criarTarefaButton.heightAnchor.constraint(equalToConstant: 40),
            criarTarefaButton.widthAnchor.constraint(equalToConstant: 120),
            
        ])
    }
}

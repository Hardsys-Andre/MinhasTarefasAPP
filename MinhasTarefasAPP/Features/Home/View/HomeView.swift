//
//  HomeScreen.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 4/14/23.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    func tappedCriarTarefaButton()
    
}

class HomeView: UIView {
    
    private weak var delegate: HomeViewProtocol?
    
    public func delegate(delegate: HomeViewProtocol?){
        self.delegate = delegate
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tarefas Cadastradas"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, d 'de' MMMM 'de' yyyy"
        dateFormatter.locale = Locale(identifier: "pt_BR")
        let date = Date()
        let dateString = dateFormatter.string(from: date)
        label.text = dateString
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
        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor.white.cgColor
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
    lazy var headerView: HomeHeaderView = {
        let view = HomeHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    
    }()
    lazy var headerTableView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        //view.roundCorners(cornerRadius: 20, typeCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner])
        
        //view.roundCorners(cornerRadius: 50, typeCorners: [.layerMaxXMinYCorner])
        
        return view
        
    }()
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(red: 67/255, green: 154/255, blue: 224/255, alpha: 1)
        tableView.separatorStyle = .none
        tableView.register(TarefasCriadasTableViewCell.self, forCellReuseIdentifier: TarefasCriadasTableViewCell.identifier)
        tableView.clipsToBounds = true
        tableView.roundCorners(cornerRadius: 50, typeCorners: [.layerMaxXMinYCorner])
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
        backgroundColor = UIColor(red: 67/255, green: 154/255, blue: 224/255, alpha: 1)
        configElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configElements(){
        //addSubview(titleLabel)
        //addSubview(dateLabel)
        //addSubview(userImageView)
        //addSubview(nameUserLabel)
        addSubview(headerView)
        addSubview(headerTableView)
        addSubview(tableView)
        addSubview(criarTarefaButton)
    }
    private func configConstraints(){
        NSLayoutConstraint.activate([
            
            /*titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            dateLabel.heightAnchor.constraint(equalToConstant: 30),
            
            userImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            userImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            userImageView.heightAnchor.constraint(equalToConstant: 100),
            userImageView.widthAnchor.constraint(equalToConstant: 100),
            
            nameUserLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 0),
            nameUserLabel.centerXAnchor.constraint(equalTo: userImageView.centerXAnchor),
            nameUserLabel.heightAnchor.constraint(equalToConstant: 30),
            nameUserLabel.widthAnchor.constraint(equalToConstant: 150),*/
            
            headerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 320),
            
            headerTableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            headerTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerTableView.heightAnchor.constraint(equalToConstant: 100),
            
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
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

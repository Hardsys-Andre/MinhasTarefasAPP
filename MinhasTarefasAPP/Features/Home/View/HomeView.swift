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
    
    lazy var headerView: HomeHeaderView = {
        let view = HomeHeaderView()
        view.delegate(delegate: self)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    
    }()
    lazy var headerTableView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
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
        addSubview(headerView)
        addSubview(headerTableView)
        addSubview(tableView)
    }
    private func configConstraints(){
        NSLayoutConstraint.activate([
            
            headerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 300),
            
            headerTableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            headerTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerTableView.heightAnchor.constraint(equalToConstant: 100),
            
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
extension HomeView: HomeHeaderViewProtocol {
    func tappedCreateNewTask() {
        self.delegate?.tappedCriarTarefaButton()
    }
}

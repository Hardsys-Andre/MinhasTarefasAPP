//
//  TarefasCriadasTableViewCellScreen.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 4/14/23.
//

import UIKit

class TarefasCriadasTableViewCellView: UIView {
    
    lazy var titleTarefaLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = "Tarefa criada"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        
        return label
    }()
    
    lazy var dateTarefaLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = "10/04/2023"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        
        return label
    }()
    
    

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
        addSubview(titleTarefaLabel)
        addSubview(dateTarefaLabel)
    }
    private func configConstraints(){
        NSLayoutConstraint.activate([
            titleTarefaLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            titleTarefaLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            titleTarefaLabel.heightAnchor.constraint(equalToConstant: 30),
            
            dateTarefaLabel.topAnchor.constraint(equalTo: titleTarefaLabel.bottomAnchor, constant: 0),
            dateTarefaLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            dateTarefaLabel.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    
}

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
        label.font = UIFont.boldSystemFont(ofSize: 20)
        
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
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
            titleTarefaLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleTarefaLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            titleTarefaLabel.heightAnchor.constraint(equalToConstant: 35),
            
            dateTarefaLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            dateTarefaLabel.leadingAnchor.constraint(equalTo: titleTarefaLabel.trailingAnchor, constant: 10),
            dateTarefaLabel.heightAnchor.constraint(equalToConstant: 35),
        ])
    }
    
}

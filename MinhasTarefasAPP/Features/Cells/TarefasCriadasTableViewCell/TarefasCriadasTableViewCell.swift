//
//  TarefasCriadasTableViewCell.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 4/14/23.
//

import UIKit
import Firebase

class TarefasCriadasTableViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: TarefasCriadasTableViewCell.self)
    
    lazy var view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        clipsToBounds = true
        view.layer.cornerRadius = 10
        return view
        
    }()
    
    lazy var categoryImageVIew: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "person")
        image.tintColor = .cyan
        
        return image
    }()
    
    lazy var titleTarefaLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Tarefa criada"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        
        return label
    }()
    
    lazy var hourTarefaLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.backgroundColor = .black
        label.text = "10/04/2023"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.clipsToBounds = true
        label.layer.cornerRadius = 10
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor(red: 67/255, green: 154/255, blue: 224/255, alpha: 1)
        configElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureTask(model: TaskModel?){
        
            titleTarefaLabel.text = model?.title
            hourTarefaLabel.text = model?.hour
        
        
    }
    
    
    private func configElements(){
        addSubview(view)
        view.addSubview(categoryImageVIew)
        view.addSubview(titleTarefaLabel)
        view.addSubview(hourTarefaLabel)
    }
    private func configConstraints(){
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 30),
            view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            
            categoryImageVIew.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            categoryImageVIew.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            categoryImageVIew.heightAnchor.constraint(equalToConstant: 80),
            categoryImageVIew.widthAnchor.constraint(equalToConstant: 80),
            
            titleTarefaLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            titleTarefaLabel.leadingAnchor.constraint(equalTo: categoryImageVIew.trailingAnchor, constant: 15),
            titleTarefaLabel.heightAnchor.constraint(equalToConstant: 30),
            
            hourTarefaLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 10),
            hourTarefaLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            hourTarefaLabel.heightAnchor.constraint(equalToConstant: 30),
            hourTarefaLabel.widthAnchor.constraint(equalToConstant: 120),
        ])
    }
    
}

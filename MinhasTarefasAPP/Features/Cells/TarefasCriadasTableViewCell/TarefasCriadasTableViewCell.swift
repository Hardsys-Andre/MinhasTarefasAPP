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
    
    lazy var descriptionTarefaLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 67/255, green: 154/255, blue: 224/255, alpha: 1)
        label.text = "Descrição"
        label.clipsToBounds = true
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 16)
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
        descriptionTarefaLabel.text = model?.description
        
        if model?.category == "Trabalho" {
            categoryImageVIew.image = UIImage(named: "work")
        }else if model?.category == "Escola" {
                categoryImageVIew.image = UIImage(named: "scholl")
        }else if model?.category == "Saude" {
            categoryImageVIew.image = UIImage(named: "saude")
        }else if model?.category == "Alimentacao" {
            categoryImageVIew.image = UIImage(named: "alimentacao")
        }else if model?.category == "Domestica" {
            categoryImageVIew.image = UIImage(named: "domestica")
        }else if model?.category == "Lazer" {
            categoryImageVIew.image = UIImage(named: "sport")
        }else if model?.category == "Outra" {
            categoryImageVIew.image = UIImage(named: "others")
        }
    }
    
    private func configElements(){
        addSubview(view)
        view.addSubview(categoryImageVIew)
        view.addSubview(titleTarefaLabel)
        view.addSubview(descriptionTarefaLabel)
        view.addSubview(hourTarefaLabel)
    }
    private func configConstraints(){
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 20),
            view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            categoryImageVIew.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            categoryImageVIew.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            categoryImageVIew.heightAnchor.constraint(equalToConstant: 80),
            categoryImageVIew.widthAnchor.constraint(equalToConstant: 80),
            
            titleTarefaLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            titleTarefaLabel.leadingAnchor.constraint(equalTo: categoryImageVIew.trailingAnchor, constant: 5),
            titleTarefaLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            titleTarefaLabel.heightAnchor.constraint(equalToConstant: 22),
            
            descriptionTarefaLabel.topAnchor.constraint(equalTo: titleTarefaLabel.bottomAnchor, constant: 0),
            descriptionTarefaLabel.leadingAnchor.constraint(equalTo: categoryImageVIew.trailingAnchor, constant: 5),
            descriptionTarefaLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            descriptionTarefaLabel.heightAnchor.constraint(equalToConstant: 40),
            
            hourTarefaLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 10),
            hourTarefaLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            hourTarefaLabel.heightAnchor.constraint(equalToConstant: 30),
            hourTarefaLabel.widthAnchor.constraint(equalToConstant: 120),
        ])
    }
}

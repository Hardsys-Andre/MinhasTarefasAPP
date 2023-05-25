//
//  DetailsTasksView.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 5/1/23.
//

import UIKit

class DetailsTasksView: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Detalhes da Tarefa"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var titleTaskLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Título da Tarefa"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var titleTaskTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.attributedPlaceholder = NSAttributedString(string: "Título da sua tarefa", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
        tf.textColor = .black
        tf.font = UIFont.systemFont(ofSize: 20)
        tf.textAlignment = .center
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 10
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        
        return tf
    }()
    lazy var descriptionTitleTaskLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Descrição da tarefa"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        
        return label
    }()
    lazy var descriptionTaskTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.autocorrectionType = .no
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.textColor = .black
        textView.backgroundColor = .white
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.white.cgColor
        textView.clipsToBounds = true
        textView.layer.cornerRadius = 10
        
        return textView
    }()
    
    lazy var prioritTaskLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Prioridade da tarefa"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var prioritTaskTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.attributedPlaceholder = NSAttributedString(string: "Prioridade da sua tarefa", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
        tf.textColor = .black
        tf.font = UIFont.systemFont(ofSize: 20)
        tf.textAlignment = .center
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 10
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        
        return tf
    }()
    
    lazy var dateTaskLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Data e Hora da tarefa"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var dateTaskTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.attributedPlaceholder = NSAttributedString(string: "Data da sua tarefa", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
        tf.textColor = .black
        tf.font = UIFont.systemFont(ofSize: 20)
        tf.textAlignment = .center
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 10
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        
        return tf
    }()
    
    lazy var hourTaskTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.attributedPlaceholder = NSAttributedString(string: "Hora da sua tarefa", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
        tf.textColor = .black
        tf.font = UIFont.systemFont(ofSize: 20)
        tf.textAlignment = .center
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 10
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        
        return tf
    }()
    
    lazy var categoryTaskLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Categoria da tarefa"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var categoryTaskTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.attributedPlaceholder = NSAttributedString(string: "Categoria da sua tarefa", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
        tf.textColor = .black
        tf.font = UIFont.systemFont(ofSize: 20)
        tf.textAlignment = .center
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 10
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        
        return tf
    }()
    
    lazy var categoryView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.roundCorners(cornerRadius: 40, typeCorners: [.layerMaxXMaxYCorner, .layerMinXMinYCorner])
        return view
        
    }()
    
    lazy var categoryImageVIew: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        //image.image = UIImage(named: "work")
        
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 67/255, green: 154/255, blue: 224/255, alpha: 1)
        configElements()
        configConstraints()
        categoryImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func categoryImage(){
        if categoryTaskTextField.text == "Trabalho" {
            categoryImageVIew.image = UIImage(named: "work")
        }else if categoryTaskTextField.text == "Escola" {
                categoryImageVIew.image = UIImage(named: "scholl")
        }else if categoryTaskTextField.text == "Saude" {
            categoryImageVIew.image = UIImage(named: "saude")
        }else if categoryTaskTextField.text == "Alimentacao" {
            categoryImageVIew.image = UIImage(named: "alimentacao")
        }else if categoryTaskTextField.text == "Domestica" {
            categoryImageVIew.image = UIImage(named: "domestica")
        }else if categoryTaskTextField.text == "Lazer" {
            categoryImageVIew.image = UIImage(named: "sport")
        }else if categoryTaskTextField.text == "Outras" {
            categoryImageVIew.image = UIImage(named: "others")
        }
    }
    
    private func configElements(){
        addSubview(titleLabel)
        addSubview(titleTaskLabel)
        addSubview(titleTaskTextField)
        addSubview(descriptionTitleTaskLabel)
        addSubview(descriptionTaskTextView)
        addSubview(prioritTaskLabel)
        addSubview(prioritTaskTextField)
        addSubview(dateTaskLabel)
        addSubview(dateTaskTextField)
        addSubview(hourTaskTextField)
        addSubview(categoryTaskLabel)
        addSubview(categoryTaskTextField)
        addSubview(categoryView)
        categoryView.addSubview(categoryImageVIew)
    }
    private func configConstraints(){
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            titleLabel.heightAnchor.constraint(equalToConstant: 35),
            
            titleTaskLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            titleTaskLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            titleTaskLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            titleTaskLabel.heightAnchor.constraint(equalToConstant: 35),
            
            titleTaskTextField.topAnchor.constraint(equalTo: titleTaskLabel.bottomAnchor, constant: 10),
            titleTaskTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            titleTaskTextField.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            titleTaskTextField.heightAnchor.constraint(equalToConstant: 35),
            
            descriptionTitleTaskLabel.topAnchor.constraint(equalTo: titleTaskTextField.bottomAnchor, constant: 10),
            descriptionTitleTaskLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionTitleTaskLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            descriptionTitleTaskLabel.heightAnchor.constraint(equalToConstant: 35),
            
            descriptionTaskTextView.topAnchor.constraint(equalTo: descriptionTitleTaskLabel.bottomAnchor, constant: 10),
            descriptionTaskTextView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionTaskTextView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            descriptionTaskTextView.heightAnchor.constraint(equalToConstant: 100),
            
            prioritTaskLabel.topAnchor.constraint(equalTo: descriptionTaskTextView.bottomAnchor, constant: 10),
            prioritTaskLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            prioritTaskLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            prioritTaskLabel.heightAnchor.constraint(equalToConstant: 35),
            
            prioritTaskTextField.topAnchor.constraint(equalTo: prioritTaskLabel.bottomAnchor, constant: 10),
            prioritTaskTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            prioritTaskTextField.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            prioritTaskTextField.heightAnchor.constraint(equalToConstant: 35),
            
            dateTaskLabel.topAnchor.constraint(equalTo: prioritTaskTextField.bottomAnchor, constant: 10),
            dateTaskLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            dateTaskLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            dateTaskLabel.heightAnchor.constraint(equalToConstant: 35),
            
            dateTaskTextField.topAnchor.constraint(equalTo: dateTaskLabel.bottomAnchor, constant: 10),
            dateTaskTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            dateTaskTextField.widthAnchor.constraint(equalToConstant: 150),
            dateTaskTextField.heightAnchor.constraint(equalToConstant: 35),
            
            hourTaskTextField.topAnchor.constraint(equalTo: dateTaskLabel.bottomAnchor, constant: 10),
            hourTaskTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            hourTaskTextField.widthAnchor.constraint(equalToConstant: 100),
            hourTaskTextField.heightAnchor.constraint(equalToConstant: 35),
            
            categoryTaskLabel.topAnchor.constraint(equalTo: dateTaskTextField.bottomAnchor, constant: 10),
            categoryTaskLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            categoryTaskLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            categoryTaskLabel.heightAnchor.constraint(equalToConstant: 35),
            
            categoryTaskTextField.topAnchor.constraint(equalTo: categoryTaskLabel.bottomAnchor, constant: 10),
            categoryTaskTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            categoryTaskTextField.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            categoryTaskTextField.heightAnchor.constraint(equalToConstant: 35),
            
            categoryView.topAnchor.constraint(equalTo: categoryTaskTextField.bottomAnchor, constant: 10),
            categoryView.centerXAnchor.constraint(equalTo: centerXAnchor),
            categoryView.widthAnchor.constraint(equalToConstant: 150),
            categoryView.heightAnchor.constraint(equalToConstant: 90),
            
            categoryImageVIew.topAnchor.constraint(equalTo: categoryView.topAnchor, constant: 5),
            categoryImageVIew.centerXAnchor.constraint(equalTo: categoryView.centerXAnchor),
            categoryImageVIew.heightAnchor.constraint(equalToConstant: 80),
            categoryImageVIew.widthAnchor.constraint(equalToConstant: 80),
        ])
    }
}

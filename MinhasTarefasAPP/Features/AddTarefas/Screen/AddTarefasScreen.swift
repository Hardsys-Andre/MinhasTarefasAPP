//
//  AddTarefasScreen.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 4/14/23.
//

import UIKit

protocol AddTarefasScreenProtocol: AnyObject {
    func tappedDataPickerButton()
    func tappedCriarTarefa()
    func tappedBackImage()
    func tappedCloseDataPicker()
}


class AddTarefasScreen: UIView {
    
    private weak var delegate: AddTarefasScreenProtocol?
    public func delegate(delegate: AddTarefasScreenProtocol?){
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
        label.text = "Crie Sua Tarefa"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var titleTarefaTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .gray
        tf.borderStyle = .roundedRect
        tf.attributedPlaceholder = NSAttributedString(string: "Digite um título para sua tarefa", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
        tf.textColor = .white
        tf.font = UIFont.systemFont(ofSize: 20)
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 10
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        
        return tf
    }()
    lazy var descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Descreva sua tarefa abaixo"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        
        return label
    }()
    lazy var descriptionTarefasTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.autocorrectionType = .no
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.textColor = .white
        textView.backgroundColor = .gray
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.white.cgColor
        textView.clipsToBounds = true
        textView.layer.cornerRadius = 10
        
        return textView
    }()
    
    lazy var prioritLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Prioridade da tarefa"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var importanteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.backgroundColor = UIColor(red: 187/255, green: 187/255, blue: 187/255, alpha: 1)
        button.setTitle("Importante", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.tintColor = .white
        //button.addTarget(self, action: #selector(tappedCloseButton), for: .touchUpInside)
        
        return button
    }()
    
    lazy var comumButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.backgroundColor = UIColor(red: 187/255, green: 187/255, blue: 187/255, alpha: 1)
        button.setTitle("Comum", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.tintColor = .white
        //button.addTarget(self, action: #selector(tappedCloseButton), for: .touchUpInside)
        
        return button
    }()
    lazy var dataHoraLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Escolha a data e horário da tarefa"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        
        return label
    }()
    
    /*lazy var dataPickerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
        return view
        
    }()*/
    lazy var dataPicker: UIDatePicker = {
        let dataPicker = UIDatePicker()
        dataPicker.translatesAutoresizingMaskIntoConstraints = false
        dataPicker.datePickerMode = .dateAndTime
        dataPicker.backgroundColor = .gray
        dataPicker.clipsToBounds = true
        dataPicker.layer.cornerRadius = 8
        dataPicker.addTarget(self, action: #selector(tapped), for: .valueChanged)
        
        
        return dataPicker
    }()
    
    @objc func tapped(){
        self.delegate?.tappedCloseDataPicker()
    }
    /*@objc func dataPickerValueChanged (_ sender: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyy - HH:mm"
        let selectedDate = dateFormatter.string(from: sender.date)
      
        print(selectedDate)
        //presentedViewController?.dismiss(animated: true, completion: nil)
    }*/
    
    /*lazy var dataPickerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.backgroundColor = UIColor(red: 187/255, green: 187/255, blue: 187/255, alpha: 1)
        button.setTitle("Data", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.tintColor = .white
        button.addTarget(self, action: #selector(tappedDataPickerButton), for: .touchUpInside)
        
        return button
    }()
    
    @objc func tappedDataPickerButton(){
        self.delegate?.tappedDataPickerButton()
    }*/
    
    lazy var categoriaLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Categoria da tarefa"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        
        return label
    }()
    
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.setCollectionViewLayout(layout, animated: false)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .black
        collectionView.register(AddTarefasCollectionViewCell.self, forCellWithReuseIdentifier: AddTarefasCollectionViewCell.identifier)
        
        return collectionView
    }()
    
    func configCollectionView(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource){
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
        
    }
    
    lazy var criarTarefaButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.backgroundColor = UIColor(red: 187/255, green: 187/255, blue: 187/255, alpha: 1)
        button.setTitle("Criar Tarefa", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.tintColor = .white
        button.addTarget(self, action: #selector(tappedCriarTarefa), for: .touchUpInside)
        
        return button
    }()
    
    @objc func tappedCriarTarefa(){
        self.delegate?.tappedCriarTarefa()
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
        addSubview(titleTarefaTextField)
        addSubview(descriptionTitleLabel)
        addSubview(descriptionTarefasTextView)
        addSubview(prioritLabel)
        addSubview(importanteButton)
        addSubview(comumButton)
        addSubview(dataHoraLabel)
        addSubview(dataPicker)
        //addSubview(dataPickerButton)
        addSubview(categoriaLabel)
        addSubview(collectionView)
        addSubview(criarTarefaButton)
        
    }
    /*private func configDataPickerView(){
        addSubview(dataPickerView)
        dataPickerView.addSubview(dataPicker)
        dataPickerView.addSubview(closeDataPickerButton)
    }*/
    
    /*private func configConstraintsDataPickerView(){
        NSLayoutConstraint.activate([
            dataPickerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            dataPickerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            dataPickerView.heightAnchor.constraint(equalToConstant: 350),
            dataPickerView.widthAnchor.constraint(equalToConstant: 350),
            
            closeDataPickerButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            closeDataPickerButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            closeDataPickerButton.heightAnchor.constraint(equalToConstant: 35),
            closeDataPickerButton.widthAnchor.constraint(equalToConstant: 120),
        ])
    }*/
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            backImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            backImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            backImageView.heightAnchor.constraint(equalToConstant: 30),
            backImageView.widthAnchor.constraint(equalToConstant: 30),
            
            titleLabel.topAnchor.constraint(equalTo: backImageView.bottomAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            titleTarefaTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            titleTarefaTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            titleTarefaTextField.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            titleTarefaTextField.heightAnchor.constraint(equalToConstant: 35),
            
            descriptionTitleLabel.topAnchor.constraint(equalTo: titleTarefaTextField.bottomAnchor, constant: 5),
            descriptionTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionTitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            descriptionTitleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            descriptionTarefasTextView.topAnchor.constraint(equalTo: descriptionTitleLabel.bottomAnchor, constant: 5),
            descriptionTarefasTextView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionTarefasTextView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            descriptionTarefasTextView.heightAnchor.constraint(equalToConstant: 120),
            
            prioritLabel.topAnchor.constraint(equalTo: descriptionTarefasTextView.bottomAnchor, constant: 10),
            prioritLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            prioritLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            prioritLabel.heightAnchor.constraint(equalToConstant: 30),
            
            importanteButton.topAnchor.constraint(equalTo: prioritLabel.bottomAnchor, constant: 5),
            importanteButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            importanteButton.heightAnchor.constraint(equalToConstant: 40),
            importanteButton.widthAnchor.constraint(equalToConstant: 120),
            
            comumButton.topAnchor.constraint(equalTo: prioritLabel.bottomAnchor, constant: 5),
            comumButton.trailingAnchor.constraint(equalTo: trailingAnchor , constant: -5),
            comumButton.heightAnchor.constraint(equalToConstant: 40),
            comumButton.widthAnchor.constraint(equalToConstant: 120),
            
            dataHoraLabel.topAnchor.constraint(equalTo: importanteButton.bottomAnchor, constant: 10),
            dataHoraLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            dataHoraLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            dataHoraLabel.heightAnchor.constraint(equalToConstant: 30),
            
            /*dataPickerButton.topAnchor.constraint(equalTo: dataHoraLabel.bottomAnchor, constant: 10),
            dataPickerButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            dataPickerButton.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            dataPickerButton.heightAnchor.constraint(equalToConstant: 30),*/
            
            dataPicker.topAnchor.constraint(equalTo: dataHoraLabel.bottomAnchor, constant: 10),
            dataPicker.centerXAnchor.constraint(equalTo: centerXAnchor),
            dataPicker.heightAnchor.constraint(equalToConstant: 40),
            
            /*dataEscolhidaLabel.topAnchor.constraint(equalTo: dataHoraLabel.bottomAnchor, constant: 10),
            dataEscolhidaLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            dataEscolhidaLabel.heightAnchor.constraint(equalToConstant: 40),*/
            
            categoriaLabel.topAnchor.constraint(equalTo: dataPicker.bottomAnchor, constant: 10),
            categoriaLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            categoriaLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            categoriaLabel.heightAnchor.constraint(equalToConstant: 30),
            
            collectionView.topAnchor.constraint(equalTo: categoriaLabel.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            collectionView.heightAnchor.constraint(equalToConstant: 125),
            
            criarTarefaButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 10),
            criarTarefaButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            criarTarefaButton.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            criarTarefaButton.heightAnchor.constraint(equalToConstant: 30),
            
            
            
            
        ])
    }
    
}

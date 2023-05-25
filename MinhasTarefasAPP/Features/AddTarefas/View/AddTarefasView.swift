//
//  AddTarefasScreen.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 4/14/23.
//

import UIKit

protocol AddTarefasViewProtocol: AnyObject {
    func tappedCriarTarefa()
    func tappedBackImage()
    func tappedImportante()
    func tappedComum()
}

class AddTarefasView: UIView {
    
    private weak var delegate: AddTarefasViewProtocol?
    public func delegate(delegate: AddTarefasViewProtocol?){
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
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        return label
    }()
    
    lazy var titleTarefaTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.attributedPlaceholder = NSAttributedString(string: "Digite um título para sua tarefa", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black.withAlphaComponent(0.4)])
        tf.textColor = .black
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
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    lazy var descriptionTarefasTextView: UITextView = {
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
    
    lazy var prioritLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Prioridade da tarefa"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        return label
    }()
    
    lazy var importanteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Importante", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        button.clipsToBounds = true
        button.backgroundColor = nil
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.tintColor = .white
        button.addTarget(self, action: #selector(tappedImportante), for: .touchUpInside)
        return button
    }()
    @objc func tappedImportante(){
        self.delegate?.tappedImportante()
    }
    
    lazy var comumButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Comum", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        button.clipsToBounds = true
        button.backgroundColor = nil
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.tintColor = .white
        button.addTarget(self, action: #selector(tappedComum), for: .touchUpInside)
        return button
    }()
    @objc func tappedComum(){
        self.delegate?.tappedComum()
    }
    
    lazy var dataHoraLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Data e horário da sua tarefa"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    lazy var datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.tintColor = .black
        picker.clipsToBounds = true
        picker.layer.cornerRadius = 10
        picker.layer.borderColor = UIColor.white.cgColor
        picker.layer.borderWidth = 2
        picker.contentHorizontalAlignment = .center
        picker.addTarget(self, action: #selector(dataPickerValueChanged), for: .valueChanged)
        return picker
    }()
    var selectedDate: String?
    @objc func dataPickerValueChanged(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MMM-yyy"
        dateFormatter.locale = Locale(identifier: "pt_BR")
        let date = datePicker.date
        selectedDate = dateFormatter.string(for: date)
    }
    
    lazy var hourDatePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .time
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.tintColor = .black
        picker.clipsToBounds = true
        picker.layer.cornerRadius = 10
        picker.layer.borderColor = UIColor.white.cgColor
        picker.layer.borderWidth = 2
        picker.contentHorizontalAlignment = .center
        picker.addTarget(self, action: #selector(hourDatePickerValueChanged), for: .valueChanged)
        return picker
    }()
    var selectedHour: String?
    @objc func hourDatePickerValueChanged(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.locale = Locale(identifier: "pt_BR")
        let date = datePicker.date
        selectedHour = dateFormatter.string(for: date)
    }
    
    lazy var categoriaLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Categoria da tarefa"
        label.textColor = .black
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
        collectionView.backgroundColor = UIColor(red: 67/255, green: 154/255, blue: 224/255, alpha: 1)
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
        backgroundColor = UIColor(red: 67/255, green: 154/255, blue: 224/255, alpha: 1)
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
        addSubview(datePicker)
        addSubview(hourDatePicker)
        addSubview(categoriaLabel)
        addSubview(collectionView)
        addSubview(criarTarefaButton)
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            backImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15),
            backImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            backImageView.heightAnchor.constraint(equalToConstant: 30),
            backImageView.widthAnchor.constraint(equalToConstant: 30),
            
            titleLabel.topAnchor.constraint(equalTo: backImageView.bottomAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
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
            importanteButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            importanteButton.heightAnchor.constraint(equalToConstant: 40),
            importanteButton.widthAnchor.constraint(equalToConstant: 120),
            
            comumButton.topAnchor.constraint(equalTo: prioritLabel.bottomAnchor, constant: 5),
            comumButton.trailingAnchor.constraint(equalTo: trailingAnchor , constant: -25),
            comumButton.heightAnchor.constraint(equalToConstant: 40),
            comumButton.widthAnchor.constraint(equalToConstant: 120),
            
            dataHoraLabel.topAnchor.constraint(equalTo: importanteButton.bottomAnchor, constant: 10),
            dataHoraLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            dataHoraLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            dataHoraLabel.heightAnchor.constraint(equalToConstant: 30),
            
            datePicker.topAnchor.constraint(equalTo: dataHoraLabel.bottomAnchor, constant: 10),
            datePicker.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            datePicker.widthAnchor.constraint(equalToConstant: 120),
            datePicker.heightAnchor.constraint(equalToConstant: 45),
            
            hourDatePicker.topAnchor.constraint(equalTo: dataHoraLabel.bottomAnchor, constant: 10),
            hourDatePicker.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            hourDatePicker.widthAnchor.constraint(equalToConstant: 100),
            hourDatePicker.heightAnchor.constraint(equalToConstant: 45),
            
            categoriaLabel.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 10),
            categoriaLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            categoriaLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            categoriaLabel.heightAnchor.constraint(equalToConstant: 30),
            
            collectionView.topAnchor.constraint(equalTo: categoriaLabel.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            collectionView.heightAnchor.constraint(equalToConstant: 125),
            
            criarTarefaButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 10),
            criarTarefaButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
            criarTarefaButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -35),
            criarTarefaButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}

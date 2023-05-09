//
//  AddTarefasCollectionViewCell.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 4/14/23.
//

import UIKit

protocol AddTarefasCollectionViewCellProtocol: AnyObject {
    func categorySelected(withName name: String)
}


class AddTarefasCollectionViewCell: UICollectionViewCell {
    
    private weak var delegate: AddTarefasCollectionViewCellProtocol?
    public func delegate(delegate: AddTarefasCollectionViewCellProtocol?){
        self.delegate = delegate
    }
    
    
    static let identifier: String = String(describing: AddTarefasCollectionViewCell.self)
    
    lazy var cellAddTarefasView: AddTarefasCollectionViewCellView = {
        let view = AddTarefasCollectionViewCellView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configElements()
        configConstraints()
        cellAddTarefasView.delegate(delegate: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configElements(){
        contentView.addSubview(cellAddTarefasView)
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            cellAddTarefasView.topAnchor.constraint(equalTo: topAnchor),
            cellAddTarefasView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellAddTarefasView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cellAddTarefasView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
    }
    var categoryTask: String?
    
    
}

extension AddTarefasCollectionViewCell: AddTarefasCollectionViewCellViewProtocol {
    
    
    func tappedTrabalho() {
        let categoriTask = "Trabalho"
        delegate?.categorySelected(withName: categoriTask)
        
        cellAddTarefasView.trabalhoButton.backgroundColor = .gray
        cellAddTarefasView.escolaButton.backgroundColor = .blue
        cellAddTarefasView.lazerButton.backgroundColor = .orange
        cellAddTarefasView.saudeButton.backgroundColor = .green
        cellAddTarefasView.alimentacaoButton.backgroundColor = .brown
        cellAddTarefasView.domesticaButton.backgroundColor = .purple
        cellAddTarefasView.outrasButton.backgroundColor = .systemPink
    }
    
    func tappedEscola() {
        let categoriTask = "Escola"
        delegate?.categorySelected(withName: categoriTask)
        
        cellAddTarefasView.trabalhoButton.backgroundColor = .red
        cellAddTarefasView.escolaButton.backgroundColor = .gray
        cellAddTarefasView.lazerButton.backgroundColor = .orange
        cellAddTarefasView.saudeButton.backgroundColor = .green
        cellAddTarefasView.alimentacaoButton.backgroundColor = .brown
        cellAddTarefasView.domesticaButton.backgroundColor = .purple
        cellAddTarefasView.outrasButton.backgroundColor = .systemPink
    }
    
    func tappedLazer() {
        let categoriTask = "Lazer"
        delegate?.categorySelected(withName: categoriTask)
        
        cellAddTarefasView.trabalhoButton.backgroundColor = .red
        cellAddTarefasView.escolaButton.backgroundColor = .blue
        cellAddTarefasView.lazerButton.backgroundColor = .gray
        cellAddTarefasView.saudeButton.backgroundColor = .green
        cellAddTarefasView.alimentacaoButton.backgroundColor = .brown
        cellAddTarefasView.domesticaButton.backgroundColor = .purple
        cellAddTarefasView.outrasButton.backgroundColor = .systemPink
    }
    
    func tappedSaude() {
        let categoriTask = "Saude"
        delegate?.categorySelected(withName: categoriTask)
        
        cellAddTarefasView.trabalhoButton.backgroundColor = .red
        cellAddTarefasView.escolaButton.backgroundColor = .blue
        cellAddTarefasView.lazerButton.backgroundColor = .orange
        cellAddTarefasView.saudeButton.backgroundColor = .gray
        cellAddTarefasView.alimentacaoButton.backgroundColor = .brown
        cellAddTarefasView.domesticaButton.backgroundColor = .purple
        cellAddTarefasView.outrasButton.backgroundColor = .systemPink
    }
    
    func tappedAlimentacao() {
        let categoriTask = "Alimentacao"
        delegate?.categorySelected(withName: categoriTask)
        
        cellAddTarefasView.trabalhoButton.backgroundColor = .red
        cellAddTarefasView.escolaButton.backgroundColor = .blue
        cellAddTarefasView.lazerButton.backgroundColor = .orange
        cellAddTarefasView.saudeButton.backgroundColor = .green
        cellAddTarefasView.alimentacaoButton.backgroundColor = .gray
        cellAddTarefasView.domesticaButton.backgroundColor = .purple
        cellAddTarefasView.outrasButton.backgroundColor = .systemPink
    }
    
    func tappedDomestica() {
        let categoriTask = "Domestica"
        delegate?.categorySelected(withName: categoriTask)
        
        cellAddTarefasView.trabalhoButton.backgroundColor = .red
        cellAddTarefasView.escolaButton.backgroundColor = .blue
        cellAddTarefasView.lazerButton.backgroundColor = .orange
        cellAddTarefasView.saudeButton.backgroundColor = .green
        cellAddTarefasView.alimentacaoButton.backgroundColor = .brown
        cellAddTarefasView.domesticaButton.backgroundColor = .gray
        cellAddTarefasView.outrasButton.backgroundColor = .systemPink
    }
    
    func tappedOutra() {
        let categoriTask = "Outra"
        delegate?.categorySelected(withName: categoriTask)
        
        cellAddTarefasView.trabalhoButton.backgroundColor = .red
        cellAddTarefasView.escolaButton.backgroundColor = .blue
        cellAddTarefasView.lazerButton.backgroundColor = .orange
        cellAddTarefasView.saudeButton.backgroundColor = .green
        cellAddTarefasView.alimentacaoButton.backgroundColor = .brown
        cellAddTarefasView.domesticaButton.backgroundColor = .purple
        cellAddTarefasView.outrasButton.backgroundColor = .gray
    }
    
    
}

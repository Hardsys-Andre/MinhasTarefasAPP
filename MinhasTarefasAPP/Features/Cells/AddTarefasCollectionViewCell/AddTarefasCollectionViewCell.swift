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
        var categoriTask = "Trabalho"
        delegate?.categorySelected(withName: categoriTask)
     
        cellAddTarefasView.trabalhoButton.backgroundColor = .gray
        cellAddTarefasView.escolaButton.backgroundColor = .blue
        cellAddTarefasView.lazerButton.backgroundColor = .orange
        cellAddTarefasView.saudeButton.backgroundColor = .green
        cellAddTarefasView.alimentacaoButton.backgroundColor = .yellow
        cellAddTarefasView.domesticaButton.backgroundColor = .purple
        cellAddTarefasView.outrasButton.backgroundColor = .systemPink
    }
    
    func tappedEscola() {
        var categoriTask = "Escola"
        delegate?.categorySelected(withName: categoriTask)
        
        cellAddTarefasView.trabalhoButton.backgroundColor = .red
        cellAddTarefasView.escolaButton.backgroundColor = .gray
        cellAddTarefasView.lazerButton.backgroundColor = .orange
        cellAddTarefasView.saudeButton.backgroundColor = .green
        cellAddTarefasView.alimentacaoButton.backgroundColor = .yellow
        cellAddTarefasView.domesticaButton.backgroundColor = .purple
        cellAddTarefasView.outrasButton.backgroundColor = .systemPink
    }
    
    func tappedLazer() {
        var categoriTask = "Lazer"
        delegate?.categorySelected(withName: categoriTask)
        
        cellAddTarefasView.trabalhoButton.backgroundColor = .red
        cellAddTarefasView.escolaButton.backgroundColor = .blue
        cellAddTarefasView.lazerButton.backgroundColor = .gray
        cellAddTarefasView.saudeButton.backgroundColor = .green
        cellAddTarefasView.alimentacaoButton.backgroundColor = .yellow
        cellAddTarefasView.domesticaButton.backgroundColor = .purple
        cellAddTarefasView.outrasButton.backgroundColor = .systemPink
    }
    
    func tappedSaude() {
        var categoriTask = "Saude"
        delegate?.categorySelected(withName: categoriTask)
        
        cellAddTarefasView.trabalhoButton.backgroundColor = .red
        cellAddTarefasView.escolaButton.backgroundColor = .blue
        cellAddTarefasView.lazerButton.backgroundColor = .orange
        cellAddTarefasView.saudeButton.backgroundColor = .gray
        cellAddTarefasView.alimentacaoButton.backgroundColor = .yellow
        cellAddTarefasView.domesticaButton.backgroundColor = .purple
        cellAddTarefasView.outrasButton.backgroundColor = .systemPink
    }
    
    func tappedAlimentacao() {
        var categoriTask = "Alimentacao"
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
        var categoriTask = "Domestica"
        delegate?.categorySelected(withName: categoriTask)
        
        cellAddTarefasView.trabalhoButton.backgroundColor = .red
        cellAddTarefasView.escolaButton.backgroundColor = .blue
        cellAddTarefasView.lazerButton.backgroundColor = .orange
        cellAddTarefasView.saudeButton.backgroundColor = .green
        cellAddTarefasView.alimentacaoButton.backgroundColor = .yellow
        cellAddTarefasView.domesticaButton.backgroundColor = .gray
        cellAddTarefasView.outrasButton.backgroundColor = .systemPink
    }
    
    func tappedOutra() {
        var categoriTask = "Outra"
        delegate?.categorySelected(withName: categoriTask)
        
        cellAddTarefasView.trabalhoButton.backgroundColor = .red
        cellAddTarefasView.escolaButton.backgroundColor = .blue
        cellAddTarefasView.lazerButton.backgroundColor = .orange
        cellAddTarefasView.saudeButton.backgroundColor = .green
        cellAddTarefasView.alimentacaoButton.backgroundColor = .yellow
        cellAddTarefasView.domesticaButton.backgroundColor = .purple
        cellAddTarefasView.outrasButton.backgroundColor = .gray
    }
    
    
}

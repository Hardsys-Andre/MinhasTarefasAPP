//
//  AddTarefasCollectionViewCell.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 4/14/23.
//

import UIKit

class AddTarefasCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = String(describing: AddTarefasCollectionViewCell.self)
    
    lazy var screen: AddTarefasCollectionViewCellScreen = {
        let view = AddTarefasCollectionViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configElements(){
        contentView.addSubview(screen)
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            screen.topAnchor.constraint(equalTo: topAnchor),
            screen.leadingAnchor.constraint(equalTo: leadingAnchor),
            screen.trailingAnchor.constraint(equalTo: trailingAnchor),
            screen.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    public func setuoCell() {
        
    }
    
}

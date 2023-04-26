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
    
    public lazy var cellTarefasCriadasView: TarefasCriadasTableViewCellView = {
        let view = TarefasCriadasTableViewCellView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        return view
    }()
    
    var tarefasCriadasViewModel: TarefasCriadasViewModel?
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .black
        tarefasCriadasViewModel = TarefasCriadasViewModel()
        configElementes()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configElementes(){
        contentView.addSubview(cellTarefasCriadasView)
        
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            cellTarefasCriadasView.topAnchor.constraint(equalTo: topAnchor, constant:6),
            cellTarefasCriadasView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellTarefasCriadasView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cellTarefasCriadasView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6),
        ])
    }


}

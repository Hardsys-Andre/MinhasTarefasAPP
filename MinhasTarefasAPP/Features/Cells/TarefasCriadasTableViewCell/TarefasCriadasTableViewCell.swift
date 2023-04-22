//
//  TarefasCriadasTableViewCell.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 4/14/23.
//

import UIKit

class TarefasCriadasTableViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: TarefasCriadasTableViewCell.self)
    
    private lazy var cellTarefasCriadasView: TarefasCriadasTableViewCellView = {
        let view = TarefasCriadasTableViewCellView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 26/255, alpha: 1)

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
            cellTarefasCriadasView.topAnchor.constraint(equalTo: topAnchor),
            cellTarefasCriadasView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellTarefasCriadasView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cellTarefasCriadasView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }


}

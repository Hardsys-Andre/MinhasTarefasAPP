//
//  TarefasCriadasTableViewCell.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 4/14/23.
//

import UIKit

class TarefasCriadasTableViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: TarefasCriadasTableViewCell.self)
    
    private lazy var screen: TarefasCriadasTableViewCellScreen = {
        let view = TarefasCriadasTableViewCellScreen()
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
    
    //public func setupCell(delegate: ProfileTableViewCellScreenDelegate) {
       // screen.delegate(delegate: delegate)
        
   // }


}

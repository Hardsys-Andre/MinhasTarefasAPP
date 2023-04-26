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
        tarefasCriadasViewModel?.tarefas()
        configElementes()
        tasksCriates()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configElementes(){
        contentView.addSubview(cellTarefasCriadasView)
        
    }
    
    private func tasksCriates(){
        tarefasCriadasViewModel?.delegate(delegate: self)
        
        
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
extension TarefasCriadasTableViewCell: TarefasCriadasViewModelProtocol {
    
    func dataTask(title: String, dateTask: String, data: [DocumentSnapshot]) {
        
        //self.cellTarefasCriadasView.titleTarefaLabel.text = title
        //self.cellTarefasCriadasView.dateTarefaLabel.text = dateTask
        //print(cellTarefasCriadasView.titleTarefaLabel.text)
    }
    
    
}

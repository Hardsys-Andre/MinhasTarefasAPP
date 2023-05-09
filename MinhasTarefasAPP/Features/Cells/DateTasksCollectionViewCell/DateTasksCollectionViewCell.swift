//
//  DateTasksCollectionViewCell.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 5/8/23.
//

import UIKit

class DateTasksCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = String(describing: DateTasksCollectionViewCell.self)
    
    lazy var dateTaskview: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
        return view
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        configElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configElements(){
        addSubview(dateTaskview)
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            dateTaskview.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            dateTaskview.leadingAnchor.constraint(equalTo: leadingAnchor),
            dateTaskview.trailingAnchor.constraint(equalTo: trailingAnchor),
            dateTaskview.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
    }
}

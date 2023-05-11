//
//  DateTasksCollectionViewCell.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 5/8/23.
//

import UIKit

class DateTasksCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: DateTasksCollectionViewCell.self)
    
      lazy var dayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "01"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.clipsToBounds = true
        label.layer.borderWidth = 2
        label.layer.borderColor = UIColor(red: 67/255, green: 154/255, blue: 224/255, alpha: 1).cgColor
        label.layer.cornerRadius = 10
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
       configElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configElements(){
        addSubview(dayLabel)
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            dayLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            dayLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            dayLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            dayLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
        ])
    }
    
    func configureCell(day: Int) {
        dayLabel.text = String(day)
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                dayLabel.backgroundColor = UIColor(red: 67/255, green: 154/255, blue: 224/255, alpha: 1)
            } else {
                dayLabel.backgroundColor = .white
            }
        }
    }
}

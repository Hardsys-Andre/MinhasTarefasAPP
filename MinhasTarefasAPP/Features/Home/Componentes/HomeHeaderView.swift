//
//  HomeHeaderView.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 5/8/23.
//

import UIKit

class HomeHeaderView: UIView {
    
    lazy var headerTopView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
        
    }()
    lazy var headerCenterView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 67/255, green: 154/255, blue: 224/255, alpha: 1)
        return view
        
    }()
    lazy var headerLeftView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        view.roundCorners(cornerRadius: 50, typeCorners: [.layerMaxXMinYCorner])
        
        return view
        
    }()
    lazy var headerRightView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 67/255, green: 154/255, blue: 224/255, alpha: 1)
        view.roundCorners(cornerRadius: 50, typeCorners: [.layerMinXMaxYCorner])

        return view
        
    }()
    lazy var headerBottomtView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.roundCorners(cornerRadius: 50, typeCorners: [.layerMaxXMinYCorner, .layerMinXMaxYCorner])
        return view
        
    }()

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
        addSubview(headerTopView)
        headerTopView.addSubview(headerCenterView)
        headerTopView.addSubview(headerLeftView)
        headerTopView.addSubview(headerRightView)
        addSubview(headerBottomtView)
        
    }
    private func configConstraints(){
        NSLayoutConstraint.activate([
            headerTopView.topAnchor.constraint(equalTo: topAnchor),
            headerTopView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerTopView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerTopView.heightAnchor.constraint(equalToConstant: 120),
            
            headerCenterView.topAnchor.constraint(equalTo: headerTopView.topAnchor),
            headerCenterView.leadingAnchor.constraint(equalTo: headerTopView.leadingAnchor),
            headerCenterView.trailingAnchor.constraint(equalTo: headerTopView.trailingAnchor),
            headerCenterView.heightAnchor.constraint(equalToConstant: 60),
            
            headerLeftView.topAnchor.constraint(equalTo: headerTopView.topAnchor),
            headerLeftView.leadingAnchor.constraint(equalTo: headerTopView.leadingAnchor),
            headerLeftView.bottomAnchor.constraint(equalTo: headerTopView.bottomAnchor),
            headerLeftView.widthAnchor.constraint(equalToConstant: 280),
            
            headerRightView.topAnchor.constraint(equalTo: headerTopView.topAnchor),
            headerRightView.leadingAnchor.constraint(equalTo: headerLeftView.trailingAnchor),
            headerRightView.trailingAnchor.constraint(equalTo: headerTopView.trailingAnchor),
            headerRightView.heightAnchor.constraint(equalToConstant: 120),
            
            headerBottomtView.topAnchor.constraint(equalTo: headerTopView.bottomAnchor),
            headerBottomtView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerBottomtView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerBottomtView.heightAnchor.constraint(equalToConstant: 200),

        ])
    }
    
}

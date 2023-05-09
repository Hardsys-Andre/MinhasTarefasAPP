//
//  TabBarController.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 4/14/23.
//

import UIKit

class TabBarController: UITabBarController {
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewWillAppear(_ animated: Bool) {
        setupTabBar()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func setupTabBar(){
        
        let homeViewModel = HomeViewModel()
        let perfilViewModel = PerfilViewModel()
        
        let home = UINavigationController(rootViewController: HomeViewController(viewModel: homeViewModel))
        let perfil = UINavigationController(rootViewController: PerfilViewController(viewModel: perfilViewModel))
        
        setViewControllers([home, perfil], animated: false)
        tabBar.isTranslucent = false
        tabBar.tintColor = .black
        tabBar.backgroundColor = .white
        tabBar.unselectedItemTintColor = .darkGray
        
        
        guard let items = tabBar.items else { return }
        items[0].image = UIImage(systemName: "house")
        items[1].image = UIImage(systemName: "person")
    }
}

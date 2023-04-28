//
//  TabBarController.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 4/14/23.
//

import UIKit

class TabBarController: UITabBarController {
    
    var userData: UserData?
    
    init(userData: UserData){
        self.userData = userData
        
        super.init(nibName: nil, bundle: nil)


    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()

    }
    
    private func setupTabBar(){
        guard let userData = userData else{return}
            
        let viewModel = HomeViewModel(userData: userData)
        
        let home = UINavigationController(rootViewController: HomeViewController(viewModel: viewModel))
        let perfil = UINavigationController(rootViewController: PerfilViewController())
        
        setViewControllers([home, perfil], animated: false)
        tabBar.isTranslucent = false
        tabBar.tintColor = .darkGray
        let tabBarAppearence: UITabBarAppearance = UITabBarAppearance()
        tabBarAppearence.configureWithDefaultBackground()
        tabBarAppearence.backgroundColor = .darkGray
        tabBar.standardAppearance = tabBarAppearence
        //tabBar.scrollEdgeAppearance = tabBarAppearence
        
        guard let items = tabBar.items else { return }
        items[0].image = UIImage(systemName: "house")
        items[1].image = UIImage(systemName: "person")
    }

   

}

//
//  TabBarController.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 4/14/23.
//

import UIKit

class TabBarController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()

        
    }
    private func setupTabBar(){
        let home = UINavigationController(rootViewController: HomeVC())
        
        setViewControllers([home], animated: false)
        tabBar.isTranslucent = false
        tabBar.tintColor = .darkGray
        let tabBarAppearence: UITabBarAppearance = UITabBarAppearance()
        tabBarAppearence.configureWithDefaultBackground()
        tabBarAppearence.backgroundColor = .darkGray
        tabBar.standardAppearance = tabBarAppearence
        //tabBar.scrollEdgeAppearance = tabBarAppearence
        
        guard let items = tabBar.items else { return }
        items[0].image = UIImage(systemName: "house")
    }

   

}

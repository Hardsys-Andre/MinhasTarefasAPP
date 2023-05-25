//
//  LoadingViewController.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 5/23/23.
//

import UIKit

class LoadingViewController: UIViewController {

    var activityIndicator: UIActivityIndicatorView!

        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = UIColor(white: 1, alpha: 0.5)

            // Crie uma instância da UIActivityIndicatorView
            activityIndicator = UIActivityIndicatorView(style: .large)
            activityIndicator.color = .black

            // Configure a posição da UIActivityIndicatorView no centro da tela
            activityIndicator.center = view.center

            // Adicione a UIActivityIndicatorView à exibição atual
            view.addSubview(activityIndicator)

            // Comece a animação
            activityIndicator.startAnimating()
        }
    

}

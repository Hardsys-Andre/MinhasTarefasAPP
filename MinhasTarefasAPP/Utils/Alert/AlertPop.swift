//
//  AlertPop.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 4/14/23.
//

import UIKit

class AlertPop {
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func alertPop(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        // Adicione um botão "OK" ao alert com um manipulador de conclusão
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            // Quando o botão "OK" é clicado, chame o método dismiss na tela atual
            self.controller.dismiss(animated: true, completion: nil)
        }))

        controller.present(alert, animated: true, completion: nil)
    }
}

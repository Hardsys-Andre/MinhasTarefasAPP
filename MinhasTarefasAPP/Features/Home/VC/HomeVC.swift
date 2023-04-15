//
//  HomeVC.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 4/14/23.
//

import UIKit

class HomeVC: UIViewController {
    
    private var screen: HomeScreen?
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
        
    }
    
    
    override func loadView() {
        screen = HomeScreen()
        screen?.delegate(delegate: self)        
        screen?.configTableViewProtocol(delegate: self, dataSource: self)
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TarefasCriadasTableViewCell.identifier) as? TarefasCriadasTableViewCell
        
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
}

extension HomeVC: HomeScreenProtocol {
    func tappedBackImage() {
        dismiss(animated: true)
    }
    
    func tappedCriarTarefaButton() {
        let vc = AddTarefasVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
}


//
//  HomeVC.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 4/14/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var homeView: HomeView = {
        return HomeView()
    }()
    private var viewModel: HomeViewModel?
    
    init(viewModel: HomeViewModel){
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func loadView() {
        
        if let imageUrl = viewModel?.userData?.imageUrl {
            self.homeView.userImageView.sd_setImage(with: URL(string: imageUrl))
        }else{
            print("Falha na extração da URL")
        }
        self.homeView.nameUserLabel.text = viewModel?.userData?.name
        
        homeView.delegate(delegate: self)
        homeView.configTableViewProtocol(delegate: self, dataSource: self)
        view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
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

extension HomeViewController: HomeViewProtocol {
    func tappedBackImage() {
        dismiss(animated: true)
    }
    
    func tappedCriarTarefaButton() {
        let vc = AddTarefasViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
}


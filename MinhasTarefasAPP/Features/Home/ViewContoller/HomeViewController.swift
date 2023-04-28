//
//  HomeVC.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 4/14/23.
//

import UIKit
import Firebase

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
        homeView.tableView.reloadData()
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
    let tarefasCriadasCountViewModel: TarefasCriadasViewModel = TarefasCriadasViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        tarefasCriadasCountViewModel.tarefas(email: viewModel?.userData?.email ?? "")
        tarefasCriadasCountViewModel.delegateCount(delegateCount: self)
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
        homeView.tableView.addGestureRecognizer(longPressRecognizer)

    }
    var taskCount: [DocumentSnapshot] = []
    
    
    @objc func handleLongPress(_ gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state == .began {
            let touchPoint = gestureRecognizer.location(in: homeView.tableView)
            if let indexPath = homeView.tableView.indexPathForRow(at: touchPoint) {
                let selectedTask = taskCount[indexPath.row]
                if let titleTask = selectedTask.data()?["title"] as? String {
                    let alertController = UIAlertController(title: "Deletar Tarefa", message: "Você deseja deletar esta tarefa?", preferredStyle: .alert)
                    let deleteAction = UIAlertAction(title: "Deletar", style: .destructive) { [weak self] (_) in
                        // Chame aqui a função para deletar a tarefa no Firestore
                        self?.tarefasCriadasCountViewModel.deleteTask(title: titleTask)
                    }
                    let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
                    alertController.addAction(deleteAction)
                    alertController.addAction(cancelAction)
                    present(alertController, animated: true, completion: nil)
                }
            }
        }
    }


}
extension HomeViewController: tarefasCriadasCountProtocol {
    func tasksData(data: [DocumentSnapshot]) {
        taskCount = data
        homeView.tableView.reloadData()
    }
    
    
}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskCount.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TarefasCriadasTableViewCell.identifier, for: indexPath) as? TarefasCriadasTableViewCell
        tarefasCriadasCountViewModel.tarefas(email: viewModel?.userData?.email ?? "")
        let task = taskCount[indexPath.row]
        let titleTask = task.data()?["title"]
        let dateTask = task.data()?["dateTask"]
        
        cell?.cellTarefasCriadasView.titleTarefaLabel.text = titleTask as? String
        cell?.cellTarefasCriadasView.dateTarefaLabel.text = dateTask as? String
        
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

extension HomeViewController: HomeViewProtocol {
    
    func tappedCriarTarefaButton() {
        let vc = AddTarefasViewController()
        vc.emailLogado = viewModel?.userData?.email
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
}



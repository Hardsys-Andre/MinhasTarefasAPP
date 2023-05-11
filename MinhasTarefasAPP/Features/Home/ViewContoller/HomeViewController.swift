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
    private var homeHeaderView: HomeHeaderView?
    private var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.isNavigationBarHidden = true
        homeView.tableView.reloadData()
        
        if let imageUrl = viewModel.getUser()?.imageUrl {
            self.homeView.headerView.userImageView.sd_setImage(with: URL(string: imageUrl))
        }else{
            print("Falha na extração da URL")
        }
        self.homeView.headerView.userLabel.text = viewModel.getUser()?.name
        
        homeView.delegate(delegate: self)
        homeView.configTableViewProtocol(delegate: self, dataSource: self)
        view = homeView
        
    }
    
    
    
    override func loadView() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDelegate = self
        viewModel.fetchTasks()
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
        homeView.tableView.addGestureRecognizer(longPressRecognizer)
    }
    
    func addNewTask(){
        let vc = AddTarefasViewController()
        vc.emailLogado = viewModel.getUser()?.email
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @objc func handleLongPress(_ gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state == .began {
            let touchPoint = gestureRecognizer.location(in: homeView.tableView)
            if let indexPath = homeView.tableView.indexPathForRow(at: touchPoint) {
                let selectedTask = viewModel.getTask(row: indexPath.row)
                if let titleTask = viewModel.getTask(row: indexPath.row)?.title as? String {
                    let alertController = UIAlertController(title: "Deletar Tarefa", message: "Você deseja deletar esta tarefa?", preferredStyle: .alert)
                    let deleteAction = UIAlertAction(title: "Deletar", style: .destructive) { [weak self] (_) in
                        self?.viewModel.deleteTask(title: titleTask)
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

extension HomeViewController: HomeViewModelViewDelegate {
    func fetchTasksSuccess() {
        homeView.tableView.reloadData()
    }
    
    func fetchTasksFailure() {
        print("Falhaaaa")
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.dataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TarefasCriadasTableViewCell.identifier,
                                                       for: indexPath) as? TarefasCriadasTableViewCell else {
            return UITableViewCell()
        }
        cell.configureTask(model: viewModel.getTask(row: indexPath.row))
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = viewModel.getTask(row: indexPath.row)
        let detailsViewModel = DetailsTasksViewModel(taskData: task)
        let viewController = DetailsTasksViewController(viewModel: detailsViewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}

extension HomeViewController: HomeViewProtocol {
    func tappedCriarTarefaButton() {
        addNewTask()
    }
}

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
    private var alert: Alert?
    
    init(viewModel: HomeViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
        navigationController?.isNavigationBarHidden = true
        viewModel.deleteOldTasks()
        homeView.tableView.reloadData()
        
        if let imageUrl = viewModel.getUser()?.imageUrl {
            self.homeView.headerView.userImageView.sd_setImage(with: URL(string: imageUrl))
        }else{
            alert?.alert(title: "Atenção", message: "Falha na extração da URL da Imagem")
        }
        self.homeView.headerView.userLabel.text = viewModel.getUser()?.name
        homeView.delegate(delegate: self)
        homeView.configTableViewProtocol(delegate: self, dataSource: self)
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alert = Alert(controller: self)
        viewModel.viewDelegate = self
        homeView.headerView.delegateDay(delegateDay: self)
        viewModel.fetchTasks()
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
        homeView.tableView.addGestureRecognizer(longPressRecognizer)
    }
    
    func addNewTask(){
        let addTarefasViewController = AddTarefasViewController()
        addTarefasViewController.emailLogado = viewModel.getUser()?.email
        navigationController?.pushViewController(addTarefasViewController, animated: true)
        //vc.modalPresentationStyle = .fullScreen
        //present(vc, animated: true)
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
    func dayTasksSelected(){
        viewModel.fetchTasks()
    }
}

extension HomeViewController: HomeViewModelViewDelegate {
    func deleteTaskFailure() {
        alert?.alert(title: "Atenção", message: "Falha ao tentar deletar a Tarefa")
    }
    
    func fetchTasksSuccess() {
        viewModel.numberTasksToday(today: Date())
        if viewModel.numberOfTasks.count > 0 {
            homeView.headerView.notificationLabel.isHidden = false
            homeView.headerView.notificationLabel.text = String(viewModel.numberOfTasks.count)
        }
        homeView.tableView.reloadData()
    }
    
    func fetchTasksFailure() {
        alert?.alert(title: "Atenção", message: "Falha ao filtrar as Tarefas")
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.filter == true {
            return viewModel.dayTaskSelected.count
        }else{
            return viewModel.dataSource.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TarefasCriadasTableViewCell.identifier,
                                                       for: indexPath) as? TarefasCriadasTableViewCell else {
            return UITableViewCell()
        }
        if viewModel.filter == false {
            cell.configureTask(model: viewModel.getTask(row: indexPath.row))
            return cell
        }else{
            cell.configureTask(model: viewModel.getDayTask(row: indexPath.row))
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if viewModel.filter == false {
            let task = viewModel.getTask(row: indexPath.row)
            let detailsViewModel = DetailsTasksViewModel(taskData: task)
            let viewController = DetailsTasksViewController(viewModel: detailsViewModel)
            navigationController?.pushViewController(viewController, animated: true)
        }else{
            let task = viewModel.getDayTask(row: indexPath.row)
            let detailsViewModel = DetailsTasksViewModel(taskData: task)
            let viewController = DetailsTasksViewController(viewModel: detailsViewModel)
            navigationController?.pushViewController(viewController, animated: true)
        }
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

extension HomeViewController: HomeHeaderViewDayTaskProtocol {
    func tappedNotificationLabel() {
        let numberTask: String = String(viewModel.numberOfTasks.count)
        alert?.alert(title: "Atenção", message: "Você tem \(numberTask) tarefa(s) para hoje!")
    }
    
    func tappedUserImageView() {
        let perfilViewModel = PerfilViewModel()
        let perfil = PerfilViewController(viewModel: perfilViewModel)
        navigationController?.pushViewController(perfil, animated: true)
    }
    
    func tappedAllTasks() {
        viewModel.filter = false
        homeView.headerView.dateSelectedLabel.text = "Escolha por data"
        homeView.headerView.dateSelectedLabel.textColor = .white
        homeView.headerView.dateSelectedLabel.backgroundColor =  UIColor(red: 67/255, green: 154/255, blue: 224/255, alpha: 1)
        homeView.headerView.dateSelectedLabel.layer.borderWidth = 0
        homeView.headerView.allTasksLabel.isHidden = true
        homeView.tableView.reloadData()
    }
    
    func tappedDate() {
        let datePickerViewController = DataPickerViewController()
        datePickerViewController.delegate = self
        present(datePickerViewController, animated: true, completion: nil)
    }
    
    func dayTaskSelected() {
        dayTasksSelected()
    }
}

extension HomeViewController: DatePickerDelegate {
    func didSelectDate(_ date: String?) {
        viewModel.filter = true
        guard let date = date else {return }
        homeView.headerView.dateSelectedLabel.text = date
        homeView.headerView.dateSelectedLabel.textColor = .black
        homeView.headerView.dateSelectedLabel.backgroundColor = .white
        homeView.headerView.dateSelectedLabel.layer.borderWidth = 2
        homeView.headerView.dateSelectedLabel.layer.borderColor = UIColor.black.cgColor
        homeView.headerView.allTasksLabel.isHidden = false
        viewModel.taskDay(day: date)
        
        homeView.tableView.reloadData()
    }
}

//
//  AddTarefasVC.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 4/14/23.
//

import UIKit

class AddTarefasViewController: UIViewController {
    
    private var addTarefasView: AddTarefasView?
    private var viewModel: AddTarefasViewModel = AddTarefasViewModel()
    private var alert: Alert?
    
    override func loadView() {
        addTarefasView = AddTarefasView()
        view = addTarefasView
        alert = Alert(controller: self)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTarefasView?.configCollectionView(delegate: self, dataSource: self)
        addTarefasView?.delegate(delegate: self)
        viewModel.delegate(delegate: self)
    }
}

extension AddTarefasViewController: AddTarefasViewModelProtocol {
    func success() {
        
        print("Sucesso no cadastro da tarefa")
    }
    
    func failure(message: String?) {
        alert?.alert(title: "Ops Erro no Login", message: message ?? "")
    }
}
var priorityTask: String?
var categoria: String?
  

extension AddTarefasViewController: AddTarefasViewProtocol{
    func tappedImportante() {
        priorityTask = "Importante"
        addTarefasView?.importanteButton.backgroundColor = .gray
        addTarefasView?.comumButton.backgroundColor = nil
    }
    
    func tappedComum() {
        priorityTask = "Comum"
        addTarefasView?.importanteButton.backgroundColor = nil
        addTarefasView?.comumButton.backgroundColor = .gray
    }
    
    func tappedBackImage() {
        dismiss(animated: true)
    }
    func tappedCriarTarefa() {
       
        viewModel.addTarefas(email: "Tibia@gmail.com",
                             title: addTarefasView?.titleTarefaTextField.text ?? "",
                             descriptionTask: addTarefasView?.descriptionTarefasTextView.text ?? "",
                             priority: priorityTask ?? "",
                             dateTask: addTarefasView?.selectedDate ?? "",
                             category: categoria ?? "")
    }
}
extension AddTarefasViewController: AddTarefasCollectionViewCellProtocol {
    func categorySelected(withName name: String) {
        categoria = name
    }
    
}
extension AddTarefasViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AddTarefasCollectionViewCell.identifier, for: indexPath) as? AddTarefasCollectionViewCell
        cell?.delegate(delegate: self)
        return cell ?? UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 5, height: 110)
    }
    
}
//
//  DetailsTasksViewController.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 5/1/23.
//

import UIKit

class DetailsTasksViewController: UIViewController {
    
    private var detailsTasksView: DetailsTasksView?
    private var viewModel: DetailsTasksViewModel
    
    init(viewModel: DetailsTasksViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        detailsTasksView = DetailsTasksView()
        view = detailsTasksView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tasks()
    }
    
    func tasks(){
        detailsTasksView?.titleTaskTextField.text = viewModel.taskData?.title
        detailsTasksView?.descriptionTaskTextView.text = viewModel.taskData?.description
        detailsTasksView?.prioritTaskTextField.text = viewModel.taskData?.priority
        detailsTasksView?.dateTaskTextField.text = viewModel.taskData?.date
        detailsTasksView?.hourTaskTextField.text = viewModel.taskData?.hour
        detailsTasksView?.categoryTaskTextField.text = viewModel.taskData?.category
        
        if detailsTasksView?.categoryTaskTextField.text == "Trabalho" {
            detailsTasksView?.categoryImageVIew.image = UIImage(named: "work")
        }else if detailsTasksView?.categoryTaskTextField.text == "Escola" {
            detailsTasksView?.categoryImageVIew.image = UIImage(named: "scholl")
        }else if detailsTasksView?.categoryTaskTextField.text == "Saude" {
            detailsTasksView?.categoryImageVIew.image = UIImage(named: "saude")
        }else if detailsTasksView?.categoryTaskTextField.text == "Alimentacao" {
            detailsTasksView?.categoryImageVIew.image = UIImage(named: "alimentacao")
        }else if detailsTasksView?.categoryTaskTextField.text == "Domestica" {
            detailsTasksView?.categoryImageVIew.image = UIImage(named: "domestica")
        }else if detailsTasksView?.categoryTaskTextField.text == "Lazer" {
            detailsTasksView?.categoryImageVIew.image = UIImage(named: "sport")
        }else if detailsTasksView?.categoryTaskTextField.text == "Outra" {
            detailsTasksView?.categoryImageVIew.image = UIImage(named: "others")
        }
    }
}

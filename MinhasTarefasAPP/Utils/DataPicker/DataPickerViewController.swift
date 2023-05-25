//
//  DataPickerViewController.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 5/16/23.
//

import UIKit
protocol DatePickerDelegate: AnyObject {
    func didSelectDate(_ date: String?)
}

class DataPickerViewController: UIViewController {
    
    weak var delegate: DatePickerDelegate?
    private var alert: Alert?
    
    lazy var closeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.text = "X"
        label.clipsToBounds = true
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.white.cgColor
        label.layer.cornerRadius = 5
        label.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedClose))
        label.addGestureRecognizer(tapGesture)
        
        return label
    }()
    @objc func tappedClose(){
        dismiss(animated: true)
    }
    
    lazy var dataPickerview: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 67/255, green: 154/255, blue: 224/255, alpha: 1)
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 5
        view.layer.borderColor = UIColor.white.cgColor
        return view
        
    }()

    let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.clipsToBounds = true
        datePicker.layer.cornerRadius = 10
        datePicker.layer.borderColor = UIColor.white.cgColor
        datePicker.layer.borderWidth = 2
        datePicker.tintColor = .black
        datePicker.contentHorizontalAlignment = .center
        datePicker.addTarget(self, action: #selector(tappedSelectedDate), for: .valueChanged)
        
           return datePicker
       }()
    
    var selectedDate: String?
    @objc func tappedSelectedDate(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MMM-yyyy"
        dateFormatter.locale = Locale(identifier: "pt_BR")
        let date = datePicker.date
        selectedDate = dateFormatter.string(for: date)
    }
    
    lazy var okButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.setTitle("OK", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(tappedOkButton), for: .touchUpInside)
        
        return button
    }()
    
    @objc func tappedOkButton(){
        if selectedDate == nil {
            alert?.alert(title: "Atenção", message: "Escolha uma data")
        }else{
        delegate?.didSelectDate(selectedDate)
        
            dismiss(animated: true, completion: nil)
        }
    }
       
       override func viewDidLoad() {
           super.viewDidLoad()
           alert = Alert(controller: self)
           
           view.addSubview(dataPickerview)
           dataPickerview.addSubview(closeLabel)
           dataPickerview.addSubview(datePicker)
           dataPickerview.addSubview(okButton)
           
           closeLabel.topAnchor.constraint(equalTo: dataPickerview.topAnchor, constant: 10).isActive = true
           closeLabel.trailingAnchor.constraint(equalTo: dataPickerview.trailingAnchor, constant: -10).isActive = true
           closeLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
           closeLabel.widthAnchor.constraint(equalToConstant: 25).isActive = true
           
           dataPickerview.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
           dataPickerview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
           dataPickerview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
           dataPickerview.heightAnchor.constraint(equalToConstant: 180).isActive = true
           
           datePicker.centerXAnchor.constraint(equalTo: dataPickerview.centerXAnchor).isActive = true
           datePicker.topAnchor.constraint(equalTo: dataPickerview.topAnchor, constant: 35).isActive = true
           datePicker.widthAnchor.constraint(equalToConstant: 250).isActive = true
           
           okButton.topAnchor.constraint(equalTo: datePicker.bottomAnchor,constant: 20).isActive = true
           okButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60).isActive = true
           okButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60).isActive = true
           okButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
       }
    
}

//
//  AddTarefasVC.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 4/14/23.
//

import UIKit

class AddTarefasVC: UIViewController {
    
    private var screen: AddTarefasScreen?
    
    override func loadView() {
        screen = AddTarefasScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.configCollectionView(delegate: self, dataSource: self)
        screen?.delegate(delegate: self)

        
    }
    

}

extension AddTarefasVC: AddTarefasScreenProtocol{
    func tappedBackImage() {
        dismiss(animated: true)
    }
    
    func tappedCriarTarefa() {
        print(#function)
    }
    
    func tappedCloseDataPicker() {
         func dataPickerValueChanged (_ sender: UIDatePicker){
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyy - HH:mm"
            let selectedDate = dateFormatter.string(from: sender.date)
          
            print(selectedDate)
            presentedViewController?.dismiss(animated: true, completion: nil)
        }
        dataPickerValueChanged(UIDatePicker())
    }
    
    func tappedDataPickerButton() {
        
    }
    
    
}
extension AddTarefasVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AddTarefasCollectionViewCell.identifier, for: indexPath) as? AddTarefasCollectionViewCell
        
        return cell ?? UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 5, height: 110)
    }
    
}

//
//  HomeHeaderView.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 5/8/23.
//

import UIKit
protocol HomeHeaderViewProtocol: AnyObject {
    func tappedCreateNewTask()
    
}
protocol HomeHeaderViewDayTaskProtocol: AnyObject {
    func dayTaskSelected()
}

class HomeHeaderView: UIView {
    
    private weak var delegate: HomeHeaderViewProtocol?
    public func delegate(delegate: HomeHeaderViewProtocol?) {
        self.delegate = delegate
    }
    
    private weak var delegateDay: HomeHeaderViewDayTaskProtocol?
    public func delegateDay(delegateDay: HomeHeaderViewDayTaskProtocol?) {
        self.delegateDay = delegateDay
    }
    
    var homeViewModel: HomeViewModel?
    
    lazy var headerTopView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
        
    }()
    lazy var headerCenterView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 67/255, green: 154/255, blue: 224/255, alpha: 1)
        return view
        
    }()
    lazy var headerLeftView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.roundCorners(cornerRadius: 50, typeCorners: [.layerMaxXMinYCorner])
        
        return view
    }()
    
    lazy var notificationImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "bell")
        image.tintColor = UIColor(red: 67/255, green: 154/255, blue: 224/255, alpha: 1)
        image.contentMode = .scaleToFill
        image.isUserInteractionEnabled = true
        image.clipsToBounds = true
        
        return image
    }()
    
    lazy var headerRightView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 67/255, green: 154/255, blue: 224/255, alpha: 1)
        view.roundCorners(cornerRadius: 50, typeCorners: [.layerMinXMaxYCorner])

        return view
    }()
    
    lazy var userImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "user_Image")
        image.contentMode = .scaleAspectFill
        image.isUserInteractionEnabled = true
        image.clipsToBounds = true
        image.layer.cornerRadius = 35
        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor.white.cgColor
        
        return image
    }()
    lazy var userLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Usuário"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .center
        
        return label
    }()
   
    
    lazy var headerBottomtView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.roundCorners(cornerRadius: 50, typeCorners: [.layerMaxXMinYCorner, .layerMinXMaxYCorner])
        return view
        
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Minhas Tarefas"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textAlignment = .center
        
        return label
    }()
    lazy var todayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hoje é"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 67/255, green: 154/255, blue: 224/255, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .center
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, d MMMM"
        dateFormatter.locale = Locale(identifier: "pt_BR")
        let date = Date()
        let dateString = dateFormatter.string(from: date)
        label.text = dateString
        return label
    }()
    
    lazy var addTaskImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "plus.app.fill")
        image.tintColor = UIColor(red: 67/255, green: 154/255, blue: 224/255, alpha: 1)
        image.contentMode = .scaleToFill
        image.isUserInteractionEnabled = true
        image.clipsToBounds = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedCreateTask))
        image.addGestureRecognizer(tapGesture)
        
        return image
    }()
    
    @objc func tappedCreateTask(){
        self.delegate?.tappedCreateNewTask()
    }
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.setCollectionViewLayout(layout, animated: false)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        collectionView.register(DateTasksCollectionViewCell.self, forCellWithReuseIdentifier: DateTasksCollectionViewCell.identifier)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        homeViewModel = HomeViewModel()
        backgroundColor = UIColor(red: 67/255, green: 154/255, blue: 224/255, alpha: 1)
        configElements()
        configConstraints()
        homeViewModel?.selectedFirstDay(collection: collectionView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configElements(){
        addSubview(headerTopView)
        headerTopView.addSubview(headerCenterView)
        headerTopView.addSubview(headerLeftView)
        headerLeftView.addSubview(notificationImageView)
        headerTopView.addSubview(headerRightView)
        headerRightView.addSubview(userImageView)
        headerRightView.addSubview(userLabel)
        addSubview(headerBottomtView)
        headerBottomtView.addSubview(titleLabel)
        headerBottomtView.addSubview(addTaskImageView)
        headerBottomtView.addSubview(todayLabel)
        headerBottomtView.addSubview(dateLabel)
        headerBottomtView.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    private func configConstraints(){
        NSLayoutConstraint.activate([
            headerTopView.topAnchor.constraint(equalTo: topAnchor),
            headerTopView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerTopView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerTopView.heightAnchor.constraint(equalToConstant: 100),
            
            headerCenterView.topAnchor.constraint(equalTo: headerTopView.topAnchor),
            headerCenterView.leadingAnchor.constraint(equalTo: headerTopView.leadingAnchor),
            headerCenterView.trailingAnchor.constraint(equalTo: headerTopView.trailingAnchor),
            headerCenterView.heightAnchor.constraint(equalToConstant: 45),
            
            headerLeftView.topAnchor.constraint(equalTo: headerTopView.topAnchor),
            headerLeftView.leadingAnchor.constraint(equalTo: headerTopView.leadingAnchor),
            headerLeftView.bottomAnchor.constraint(equalTo: headerTopView.bottomAnchor),
            headerLeftView.widthAnchor.constraint(equalToConstant: 280),
            
            notificationImageView.bottomAnchor.constraint(equalTo: headerLeftView.bottomAnchor, constant: -35),
            notificationImageView.leadingAnchor.constraint(equalTo: headerLeftView.leadingAnchor, constant: 50),
            notificationImageView.heightAnchor.constraint(equalToConstant: 35),
            notificationImageView.widthAnchor.constraint(equalToConstant: 35),
            
            headerRightView.topAnchor.constraint(equalTo: headerTopView.topAnchor),
            headerRightView.leadingAnchor.constraint(equalTo: headerLeftView.trailingAnchor),
            headerRightView.trailingAnchor.constraint(equalTo: headerTopView.trailingAnchor),
            headerRightView.heightAnchor.constraint(equalToConstant: 100),
            
            userImageView.centerXAnchor.constraint(equalTo: headerRightView.centerXAnchor),
            userImageView.topAnchor.constraint(equalTo: headerRightView.topAnchor, constant: 3),
            userImageView.heightAnchor.constraint(equalToConstant: 70),
            userImageView.widthAnchor.constraint(equalToConstant: 70),
            
            userLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 0),
            userLabel.centerXAnchor.constraint(equalTo: headerRightView.centerXAnchor),
            userLabel.heightAnchor.constraint(equalToConstant: 20),
            
            headerBottomtView.topAnchor.constraint(equalTo: headerTopView.bottomAnchor),
            headerBottomtView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerBottomtView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerBottomtView.heightAnchor.constraint(equalToConstant: 200),
            
            titleLabel.topAnchor.constraint(equalTo: headerBottomtView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: headerBottomtView.leadingAnchor, constant: 25),
            titleLabel.heightAnchor.constraint(equalToConstant: 35),
            
            todayLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            todayLabel.leadingAnchor.constraint(equalTo: headerBottomtView.leadingAnchor, constant: 25),
            todayLabel.heightAnchor.constraint(equalToConstant: 30),
            
            addTaskImageView.topAnchor.constraint(equalTo: headerBottomtView.topAnchor, constant: 10),
            addTaskImageView.trailingAnchor.constraint(equalTo: headerBottomtView.trailingAnchor, constant: -20),
            addTaskImageView.heightAnchor.constraint(equalToConstant: 60),
            addTaskImageView.widthAnchor.constraint(equalToConstant: 60),
            
            dateLabel.topAnchor.constraint(equalTo: addTaskImageView.bottomAnchor, constant: 5),
            dateLabel.trailingAnchor.constraint(equalTo: headerBottomtView.trailingAnchor, constant: -20),
            dateLabel.heightAnchor.constraint(equalToConstant: 20),
            
            collectionView.topAnchor.constraint(equalTo: todayLabel.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: headerBottomtView.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: headerBottomtView.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 80),
            

        ])
    }
    
    private var getCurrentDate: String = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        dateFormatter.locale = Locale(identifier: "pt_BR")
        let date = Date()
        return dateFormatter.string(from: date)
    }()
}
extension HomeHeaderView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeViewModel?.getTotalDate() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DateTasksCollectionViewCell.identifier, for: indexPath) as? DateTasksCollectionViewCell
        else { return UICollectionViewCell() }

        cell.configureCell(day: indexPath.row + (Int(getCurrentDate) ?? 0))
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DateTasksCollectionViewCell", for: indexPath) as? DateTasksCollectionViewCell else { return }
        
        cell.isSelected = true
        let daySelected = Int(cell.dayLabel.text ?? "")
        if daySelected == indexPath.row{
            let date = cell.dayLabel.text ?? "" + "mai.-2023"
            print(date)
            self.delegateDay?.dayTaskSelected()
        }
        
        
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
}

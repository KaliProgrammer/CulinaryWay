//
//  MainViewController.swift
//  CulinaryWay
//
//  Created by MacBook Air on 14.12.2022.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    let mainView = MainView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        setupMainView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
        mainView.collectionView.reloadData()
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
      
        mainView.collectionView.reloadData()
       
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.all)
    }
    
    func setupNavigation() {
        view.backgroundColor = .white
        self.navigationItem.title = "Главная"
        self.navigationItem.largeTitleDisplayMode = .always
    }
    
    
    func setupMainView() {
        view.addSubview(mainView)
        mainView.snp.makeConstraints { make in
            make.leading.equalTo(self.view).offset(10)
            make.trailing.equalTo(self.view).offset(-10)
            make.top.equalTo(self.view)
            make.bottom.equalTo(self.view)
        }
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dishesCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier, for: indexPath) as? MainCollectionViewCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            return cell
        }
//
        cell.setup(cell: cell)
        cell.applyLabel(text: dishesCategories[indexPath.row].categoryName)
        if let cellImage = UIImage(named: dishesCategoriesPictures[indexPath.row]) {
            cell.apply(photos: cellImage)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.navigationBar.tintColor = .orange

        switch indexPath.row {
        case 0:
            let viewController = BeanDishesViewController()
            //navigationController?.present(viewController, animated: true)
             navigationController?.pushViewController(viewController, animated: true)
        case 1:
            let viewController = RiceDishesViewController()
            //navigationController?.present(viewController, animated: true)
            navigationController?.pushViewController(viewController, animated: true)
        case 2:
            let viewController = BreadViewController()
            //navigationController?.present(viewController, animated: true)

            navigationController?.pushViewController(viewController, animated: true)
        case 3:
            let viewController = DessertsViewController()
            //navigationController?.present(viewController, animated: true)

            navigationController?.pushViewController(viewController, animated: true)
        case 4:
            let viewController = DrinkViewController()
            //navigationController?.present(viewController, animated: true)

            navigationController?.pushViewController(viewController, animated: true)
        case 5:
            let viewController = SabjiViewController()
            //navigationController?.present(viewController, animated: true)

            navigationController?.pushViewController(viewController, animated: true)
        case 6:
            let viewController = ChutneyViewController()
            //navigationController?.present(viewController, animated: true)

            navigationController?.pushViewController(viewController, animated: true)
            
        default:
            return
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: collectionView.frame.size.width/2.3,
            height: collectionView.frame.size.width/1.8
        )
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    
}

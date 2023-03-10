//
//  BeanDishesViewController.swift
//  CulinaryWay
//
//  Created by MacBook Air on 14.12.2022.
//

import UIKit

class BeanDishesViewController: UIViewController {

  let beansView = ViewForAllDishes()
   public var storedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Блюда из бобовых"
        navigationItem.largeTitleDisplayMode = .never
        beansView.beansCollection.delegate = self
        beansView.beansCollection.dataSource = self
        setupBeansView()
    }
    
    func setupBeansView() {
        view.addSubview(beansView)
        beansView.snp.makeConstraints { make in
            make.leading.equalTo(self.view).offset(16)
            make.trailing.equalTo(self.view).offset(-16)
            make.top.equalTo(self.view)
            make.bottom.equalTo(self.view)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.all)
    }
}

extension BeanDishesViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dalData.count
    }
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: MyCustomCollectionViewCell.reuseIdentifier, for: indexPath) as! MyCustomCollectionViewCell
        item.apply(spiceLabel: dalPictures[indexPath.row])
        if let pictures = UIImage(named: dalPictures[indexPath.row]) {
            item.apply(photos: pictures)
        }
        item.layer.cornerRadius = 28
        item.setup(cell: item)
        
        return item
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewModel = RecipeViewModel()
        let viewController = RecipeViewController()
        viewController.selectedIndex = indexPath.row
        viewModel.apply(textDescription: dalData[indexPath.row].dish, from: viewController.contentView)
        if let dalImage = UIImage(named: dalPictures[indexPath.row]) {
            viewModel.loadImage(image: dalImage, from: viewController.contentView)
        }
        dishNames.append(dalData[indexPath.row])
        navigationController?.pushViewController(viewController, animated: true)
    }
}


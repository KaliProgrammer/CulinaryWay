//
//  DrinkViewController.swift
//  CulinaryWay
//
//  Created by MacBook Air on 14.12.2022.
//

import UIKit

class DrinkViewController: UIViewController {
    
    let drinkView = BeansView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Десерты"
        navigationItem.largeTitleDisplayMode = .never
        drinkView.beansCollection.delegate = self
        drinkView.beansCollection.dataSource = self
        setupDrinkView()
    }
    func  setupDrinkView() {
        view.addSubview(drinkView)
        drinkView.snp.makeConstraints { make in
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

extension DrinkViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        drinksData.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: RecipeCollectionViewCell.identifier, for: indexPath) as! RecipeCollectionViewCell
        item.apply(beansLabel: drinksPictures[indexPath.row])
        if let pictures = UIImage(named: drinksPictures[indexPath.row]) {
            item.apply(beansImage: pictures)
        }
        item.layer.cornerRadius = 28
        item.setup(cell: item)
        
        return item
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = RecipeViewController()
        viewController.selectedIndex = indexPath.row
        
        viewController.apply(textDescription: drinksData[indexPath.row].dish)
        if let breadImage = UIImage(named: drinksPictures[indexPath.row]) {
            viewController.loadImage(image: breadImage)
        }
        dishNames.append(drinksData[indexPath.row])
        navigationController?.pushViewController(viewController, animated: true)
    }
}




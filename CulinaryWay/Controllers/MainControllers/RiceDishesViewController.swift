//
//  RiceDishesViewController.swift
//  CulinaryWay
//
//  Created by MacBook Air on 14.12.2022.
//

import UIKit

class RiceDishesViewController: UIViewController {
    
    let riceView = ViewForAllDishes()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Блюда из риса"
        navigationItem.largeTitleDisplayMode = .never
        riceView.beansCollection.delegate = self
        riceView.beansCollection.dataSource = self
        setupRiceView()
    }
    func setupRiceView() {
        view.addSubview(riceView)
        riceView.snp.makeConstraints { make in
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

extension RiceDishesViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        riceData.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! MyCustomCollectionViewCell
        item.apply(spiceLabel: ricePictures[indexPath.row])
        if let pictures = UIImage(named: ricePictures[indexPath.row]) {
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
        
        viewModel.apply(textDescription: riceData[indexPath.row].dish, from: viewController.contentView)
        if let riceImage = UIImage(named: ricePictures[indexPath.row]) {
            viewModel.loadImage(image: riceImage, from: viewController.contentView)
        }
        dishNames.append(riceData[indexPath.row])
        navigationController?.pushViewController(viewController, animated: true)
    }
}


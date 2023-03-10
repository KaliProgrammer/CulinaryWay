//
//  DessertsViewController.swift
//  CulinaryWay
//
//  Created by MacBook Air on 14.12.2022.
//

import UIKit

class DessertsViewController: UIViewController {
    
    let dessertView = ViewForAllDishes()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Десерты"
        navigationItem.largeTitleDisplayMode = .never
        dessertView.beansCollection.delegate = self
        dessertView.beansCollection.dataSource = self
        setupDessertView()
    }
    func  setupDessertView() {
        view.addSubview(dessertView)
        dessertView.snp.makeConstraints { make in
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

extension DessertsViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dessertData.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: MyCustomCollectionViewCell.reuseIdentifier, for: indexPath) as! MyCustomCollectionViewCell
        item.apply(spiceLabel: dessertPictures[indexPath.row])
        if let pictures = UIImage(named: dessertPictures[indexPath.row]) {
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

        viewModel.apply(textDescription: dessertData[indexPath.row].dish, from: viewController.contentView)
        if let breadImage = UIImage(named: dessertPictures[indexPath.row]) {
            viewModel.loadImage(image: breadImage, from: viewController.contentView)
        }
        dishNames.append(dessertData[indexPath.row])
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func setBeforeReuse(viewController: RecipeViewController, content: RecipeView, imageName: String, labelText: String) {
        content.dishImage.image = UIImage(named: imageName)
        viewController.contentView = content
        content.descriptionLabel.text = labelText
        navigationController?.pushViewController(viewController, animated: true)
    }

}



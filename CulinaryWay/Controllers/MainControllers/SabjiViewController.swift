//
//  SabjiViewController.swift
//  CulinaryWay
//
//  Created by MacBook Air on 30.01.2023.
//

import UIKit

class SabjiViewController: UIViewController {

    let sabjiView = BeansView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Сабджи"
        navigationItem.largeTitleDisplayMode = .never
        sabjiView.beansCollection.delegate = self
        sabjiView.beansCollection.dataSource = self
        setupChutneyView()
    }
    func  setupChutneyView() {
        view.addSubview(sabjiView)
        sabjiView.snp.makeConstraints { make in
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

extension SabjiViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sabjiData.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: RecipeCollectionViewCell.identifier, for: indexPath) as! RecipeCollectionViewCell
        item.apply(beansLabel: sabjiPictures[indexPath.row])
        if let pictures = UIImage(named: sabjiPictures[indexPath.row]) {
            item.apply(beansImage: pictures)
        }
        item.layer.cornerRadius = 28
        item.setup(cell: item)
        
        return item
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = RecipeViewController()
        viewController.selectedIndex = indexPath.row
        
        viewController.apply(textDescription: sabjiData[indexPath.row].dish)
        if let breadImage = UIImage(named: sabjiPictures[indexPath.row]) {
            viewController.loadImage(image: breadImage)
        }
        dishNames.append(sabjiData[indexPath.row])
        navigationController?.pushViewController(viewController, animated: true)
    }
  

}


//
//  BeanDishesViewController.swift
//  CulinaryWay
//
//  Created by MacBook Air on 14.12.2022.
//

import UIKit

class BeanDishesViewController: UIViewController {
    
  let beansView = BeansView()
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dalData.count
    }
    
   
    
    //footer
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//
//           let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CollectionViewReusableFooter.identifier, for: indexPath) as! CollectionViewReusableFooter
//           return footer
//       }
//
//       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
//           CGSize(width: 100, height: 50)
//       }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: RecipeCollectionViewCell.identifier, for: indexPath) as! RecipeCollectionViewCell
        item.apply(beansLabel: dalPictures[indexPath.row])
        if let pictures = UIImage(named: dalPictures[indexPath.row]) {
            item.apply(beansImage: pictures)
        }
        //item.setOpacity()
        item.layer.cornerRadius = 28
        item.setup(cell: item)
        return item
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = RecipeViewController()
        viewController.selectedIndex = indexPath.row
        
        viewController.apply(textDescription: dalData[indexPath.row].dish)
        if let dalImage = UIImage(named: dalPictures[indexPath.row]) {
            viewController.loadImage(image: dalImage)            
        }
        dishNames.append(dalData[indexPath.row])
  
        navigationController?.pushViewController(viewController, animated: true)
       
    }
}


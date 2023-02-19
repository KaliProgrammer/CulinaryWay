//
//  BeansView.swift
//  CulinaryWay
//
//  Created by MacBook Air on 15.12.2022.
//

import Foundation
import UIKit
import SnapKit

class BeansView: UIView {
    
        lazy var beansCollection: UICollectionView = {
        let screenSize = UIScreen.main.bounds
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
            layout.itemSize =  CGSize(width: screenSize.width-50, height: screenSize.height/3)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .white
            collection.showsVerticalScrollIndicator = false
        collection.register(RecipeCollectionViewCell.self, forCellWithReuseIdentifier: RecipeCollectionViewCell.identifier)
          
        return collection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollection()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
    private func setupCollection() {
        self.addSubview(beansCollection)
        beansCollection.snp.makeConstraints { make in
            make.leading.equalTo(self)
            make.trailing.equalTo(self)
            make.top.equalTo(self.safeAreaLayoutGuide)
            make.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
    
}

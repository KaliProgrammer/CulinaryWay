//
//  MainView.swift
//  CulinaryWay
//
//  Created by MacBook Air on 14.12.2022.
//

import Foundation
import UIKit
import CollectionViewPagingLayout

class MainView: UIView {
    
    lazy var collectionView: UICollectionView = {
        let layout = CollectionViewPagingLayout()
//        layout.sectionInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        let collection = UICollectionView(
                  frame: self.frame,
                  collectionViewLayout: layout
              )

        collection.isPagingEnabled = true
        
        collection.register(MyCell.self, forCellWithReuseIdentifier: "MyCell")
        collection.register(FruitCollectionViewCell.self, forCellWithReuseIdentifier: FruitCollectionViewCell.identifier)
        collection.showsHorizontalScrollIndicator = false
        collection.decelerationRate = .fast
        collection.allowsSelection = true
        collection.allowsMultipleSelection = false
        return collection
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCollectionView() {
        self.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.leading.equalTo(self)
            make.trailing.equalTo(self)
            make.top.equalTo(self.safeAreaLayoutGuide).offset(15)
            make.bottom.equalTo(self.safeAreaLayoutGuide).offset(-20)
        }
    }
    

}


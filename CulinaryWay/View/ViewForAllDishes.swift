//
//  BeansView.swift
//  CulinaryWay
//
//  Created by MacBook Air on 15.12.2022.
//

import Foundation
import UIKit
import SnapKit
import CollectionViewPagingLayout


class ViewForAllDishes: UIView {
    
        lazy var beansCollection: UICollectionView = {
        //let screenSize = UIScreen.main.bounds
            let layout = CollectionViewPagingLayout()
            let collection = UICollectionView(
                      frame: self.frame,
                      collectionViewLayout: layout
                  )
        collection.backgroundColor = .white
        collection.showsHorizontalScrollIndicator = false
            collection.register(MyCustomCollectionViewCell.self, forCellWithReuseIdentifier: MyCustomCollectionViewCell.reuseIdentifier)
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

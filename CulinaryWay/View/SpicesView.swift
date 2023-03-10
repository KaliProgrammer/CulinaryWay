//
//  SpicesView.swift
//  CulinaryWay
//
//  Created by MacBook Air on 14.12.2022.
//

import Foundation
import UIKit
import CollectionViewPagingLayout

class SpicesView: UIView {
    
    lazy var navigationCollection: UICollectionView = {
        let screenSize = UIScreen.main.bounds
            let layout = CollectionViewPagingLayout()
            let collection = UICollectionView(
                      frame: self.frame,
                      collectionViewLayout: layout
                  )
   
        collection.backgroundColor = .white
        collection.register(SpiceCollectionViewCell.self, forCellWithReuseIdentifier: SpiceCollectionViewCell.reuseIdentifier)
        collection.register(VideoCategoriesCollectionViewCell.self, forCellWithReuseIdentifier: VideoCategoriesCollectionViewCell.reuseIdentifier)
        return collection
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollection()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = .white
    }
    
    private func  setupCollection() {
        self.addSubview(navigationCollection)
        navigationCollection.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(150)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
    }
}
    
    
    


//
//  SpicesView.swift
//  CulinaryWay
//
//  Created by MacBook Air on 14.12.2022.
//

import Foundation
import UIKit

class SpicesView: UIView {
    
    lazy var navigationCollection: UICollectionView = {
        let screenSize = UIScreen.main.bounds
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
        layout.itemSize = CGSize(width: screenSize.width-50, height: 60)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .white
        collection.register(SpiceCollectionViewCell.self, forCellWithReuseIdentifier: SpiceCollectionViewCell.identifier)
        return collection
    }()
    
//    private lazy var logoImage: UIImageView = {
//        let logo = UIImageView()
//        logo.translatesAutoresizingMaskIntoConstraints = false
//        logo.contentMode = .scaleAspectFit
//        logo.image = UIImage(named: "")
//        return logo
//    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollection()
        //setupLogoImage()
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
        self.navigationCollection.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        navigationCollection.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(200)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
    }
    
//    private func setupLogoImage() {
//        self.addSubview(logoImage)
//        logoImage.snp.makeConstraints { make in
//            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(160)
//            make.centerX.equalTo(snp.centerX)
//            make.bottom.equalTo(navigationCollection.snp.top).offset(8)
//        }
        
        
    }
    
    
    


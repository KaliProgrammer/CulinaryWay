//
//  VideoView.swift
//  CulinaryWay
//
//  Created by MacBook Air on 14.12.2022.
//

import Foundation
import UIKit

class VideoView: UIView {
    
    lazy var videoCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let screenSize = UIScreen.main.bounds
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
        layout.itemSize = CGSize(width: screenSize.width-50, height: screenSize.height / 3)
        layout.minimumLineSpacing = 36
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .white
        collection.register(VideosCollectionViewCell.self, forCellWithReuseIdentifier: VideosCollectionViewCell.reuseIdentifier)
        return collection
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollection()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCollection() {
         self.addSubview(videoCollection)
         self.videoCollection.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        videoCollection.snp.makeConstraints { make in
            make.leading.equalTo(self)
            make.trailing.equalTo(self)
            make.top.equalTo(self.safeAreaLayoutGuide)
            make.bottom.equalTo(self.safeAreaLayoutGuide)
        }
     }
    
}

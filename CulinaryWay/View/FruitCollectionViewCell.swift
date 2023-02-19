//
//  FruitCollectionViewCell.swift
//  CulinaryWay
//
//  Created by MacBook Air on 29.01.2023.
//

import UIKit
import SnapKit


class FruitCollectionViewCell: UICollectionViewCell {
    static let identifier = "FruitCollectionViewCell"
    
        private lazy var photoOfAllDishes: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            return imageView
        }()
    
        override init(frame: CGRect) {
            super.init(frame: frame)
            contentView.addSubview(photoOfAllDishes)
            contentView.layer.cornerRadius = 20
            contentView.layer.masksToBounds = true
            contentView.clipsToBounds = true
        }
          
    
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()

            photoOfAllDishes.snp.makeConstraints { make in
                make.top.equalTo(self.contentView)
                make.leading.trailing.equalTo(self.contentView)
                make.bottom.equalTo(self.contentView.snp.bottom)
            }
        }
            
    
    func apply(photos: UIImage) {
        self.photoOfAllDishes.image = photos
    }
    
    func setup(cell: FruitCollectionViewCell) {
       
        cell.layer.shadowRadius = 5.0
        cell.layer.shadowOffset = CGSize(width: 2, height: 2)
        cell.layer.shadowOpacity = 1
        cell.layer.shadowColor = .init(red: 10/255, green: 12/255, blue: 11/255, alpha: 1)

    }
    
   

}


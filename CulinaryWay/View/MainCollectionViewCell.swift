//
//  MainCollectionViewCell.swift
//  CulinaryWay
//
//  Created by MacBook Air on 14.12.2022.
//

import UIKit
import SnapKit

class MainCollectionViewCell: UICollectionViewCell {
    static let identifier = "MainCollectionViewCell"
    
    var isAtEditState: Bool = false {
        didSet {
            selectLabel.isHidden = !isAtEditState
        }
    }
    
    override var isSelected: Bool {
        didSet {
            if isAtEditState {
                selectLabel.backgroundColor = isSelected ? UIColor.systemOrange : UIColor.black.withAlphaComponent(0.5)
            }
            self.layer.shadowOffset = self.isSelected ? CGSize(width: 0, height: 0) : CGSize(width: 4, height: 4)
            self.layer.shadowRadius = self.isSelected ? 0 : 6
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            self.layer.shadowOffset = self.isHighlighted ? CGSize(width: 0, height: 0) : CGSize(width: 4, height: 4)
            self.layer.shadowRadius = self.isHighlighted ? 0 : 6
        }
    }
    
    private lazy var selectLabel: UILabel = {
           let label = UILabel()
           label.layer.cornerRadius = 19
           label.layer.masksToBounds = true
           label.layer.borderColor = UIColor.white.cgColor
           label.layer.borderWidth = 1.0
           label.backgroundColor = UIColor.black.withAlphaComponent(0.5)
           return label
       }()
    
    func setupSelectLabel() {
        self.contentView.addSubview(selectLabel)
        selectLabel.frame = CGRect(x: 113, y: 10, width: 38, height: 38)
        
    }
        
        private lazy var photoOfAllDishes: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            return imageView
        }()
        
    
        private lazy var dishesLabel: UILabel = {
            let label = UILabel()
            label.textColor = .black
            label.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
            label.textAlignment = .center
            label.numberOfLines = 0
            if (UIDevice.current.userInterfaceIdiom == .pad) {
                label.font = UIFont.systemFont(ofSize: 40, weight: .medium)
            } else {
                label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
            }
            return label
        }()
        
    

        override init(frame: CGRect) {
            super.init(frame: frame)
            contentView.addSubview(photoOfAllDishes)
            contentView.layer.cornerRadius = 20
            contentView.layer.masksToBounds = true
            contentView.clipsToBounds = true
            setupDishesLabel()
        }
          
    
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
//            photoOfAllDishes.frame = contentView.bounds
            photoOfAllDishes.snp.makeConstraints { make in
                make.top.equalTo(self.contentView)
                make.leading.trailing.equalTo(self.contentView)
                make.bottom.equalTo(self.contentView.snp.bottom).offset(-40)
            }
        }
            
         func setupDishesLabel() {
            self.contentView.addSubview(dishesLabel)
             dishesLabel.snp.makeConstraints { make in
                 make.top.equalTo(photoOfAllDishes.snp.bottom)
                 make.height.equalTo(40)
                 make.leading.trailing.equalTo(self.contentView)
             }
        }
        
        override func prepareForReuse() {
            super.prepareForReuse()
            dishesLabel.text = nil
            selectLabel.isHidden = isAtEditState
        }
        
        func apply(photos: UIImage) {
            self.photoOfAllDishes.image = photos
        }
        
        func setOpacity() {
            self.photoOfAllDishes.alpha = 0.6
        }
        
        func applyLabel(text: String) {
            self.dishesLabel.text = text
        }
    
    func setup(cell: MainCollectionViewCell) {
        cell.setupDishesLabel()
        cell.layer.shadowRadius = 6.0
        cell.layer.shadowOffset = CGSize(width: 2, height: 2)
        cell.layer.shadowOpacity = 0.8
        cell.layer.shadowColor = .init(red: 10/255, green: 12/255, blue: 11/255, alpha: 1)

    }
    
    func apply(spiceLabel: String, color: UIColor, cornerRadius: CGFloat) {
        self.dishesLabel.text = spiceLabel
        self.backgroundColor = color
        self.layer.cornerRadius = cornerRadius
    }

}

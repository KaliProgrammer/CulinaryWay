//
//  MyCustomCollectionViewCell.swift
//  CulinaryWay
//
//  Created by MacBook Air on 17.02.2023.
//

import UIKit
import CollectionViewPagingLayout

// The cell class needs to conform to `ScaleTransformView` protocol
// to be able to provide the transform options
class MyCell: UICollectionViewCell, ScaleTransformView {
    
    
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
//                self.layer.shadowOffset = self.isSelected ? CGSize(width: 0, height: 0) : CGSize(width: 4, height: 4)
//                self.layer.shadowRadius = self.isSelected ? 0 : 6
            }
        }
    
//        override var isHighlighted: Bool {
//            didSet {
//                self.layer.shadowOffset = self.isHighlighted ? CGSize(width: 0, height: 0) : CGSize(width: 4, height: 4)
//                self.layer.shadowRadius = self.isHighlighted ? 0 : 6
//            }
//        }
    
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
                    label.font = UIFont.systemFont(ofSize: 40, weight: .semibold)
                } else {
                    label.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
                }
                return label
            }()
    
    
    
    //        override init(frame: CGRect) {
    //            super.init(frame: frame)
    //            contentView.addSubview(photoOfAllDishes)
    //            contentView.layer.cornerRadius = 20
    //            contentView.layer.masksToBounds = true
    //            contentView.clipsToBounds = true
    //            setupDishesLabel()
    //        }
    
    
    //        required init?(coder: NSCoder) {
    //            fatalError("init(coder:) has not been implemented")
    //        }
    
            override func layoutSubviews() {
                super.layoutSubviews()
    //            photoOfAllDishes.frame = contentView.bounds
    //            photoOfAllDishes.snp.makeConstraints { make in
    //                make.top.equalTo(card)
    //                make.leading.trailing.equalTo(card)
    //                make.bottom.equalTo(card.snp.bottom).offset(-40)
    //            }
            }
    
    //         func setupDishesLabel() {
    //            card.addSubview(dishesLabel)
    //             dishesLabel.snp.makeConstraints { make in
    //                 make.top.equalTo(photoOfAllDishes.snp.bottom)
    //                 make.height.equalTo(40)
    //                 make.leading.trailing.equalTo(self.card)
    //             }
    //        }
    
            override func prepareForReuse() {
                super.prepareForReuse()
                dishesLabel.text = nil
                selectLabel.isHidden = isAtEditState
            }
    
            func apply(photos: UIImage) {
                self.photoOfAllDishes.image = photos
            }
    
    //        func setOpacity() {
    //            self.photoOfAllDishes.alpha = 0.6
    //        }
    
            func applyLabel(text: String) {
                self.dishesLabel.text = text
            }
    
        func setup(cell: MyCell) {
            //cell.setupDishesLabel()
            cell.layer.shadowRadius = 6.0
            cell.layer.shadowOffset = CGSize(width: 2, height: 2)
            cell.layer.shadowOpacity = 0.8
            cell.layer.shadowColor = .init(red: 10/255, green: 12/255, blue: 11/255, alpha: 1)
    
        }
    
        func apply(spiceLabel: String, color: UIColor, cornerRadius: CGFloat) {
            self.dishesLabel.text = spiceLabel
            card.backgroundColor = color
            card.layer.cornerRadius = cornerRadius
        }
    
    
    
        override init(frame: CGRect) {
            super.init(frame: frame)

            setup()
        }
    
    
    
        var scaleOptions: ScaleTransformViewOptions {
            .layout(.cylinder)
        }
    
    
        var card: UIView!
    
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            setup()
        }
    
        func setup() {
    
            // Adjust the card view frame
            // you can use Auto-layout too
            let cardFrame = CGRect(
                x: 0,
                y: 20,
                width: frame.width,
                height: frame.height - 70
            )
            card = UIView(frame: cardFrame)
            card.clipsToBounds = true
            card.layer.masksToBounds = true
            card.backgroundColor = .systemOrange
            card.layer.cornerRadius = 20
            card.addSubview(photoOfAllDishes)
    
            card.addSubview(dishesLabel)
             dishesLabel.snp.makeConstraints { make in
                 //make.top.equalTo(card.snp.top).offset(29)
                 make.height.equalTo(80)
                 make.leading.trailing.equalTo(self.card)
                 make.bottom.equalTo(card.snp.bottom)
             }
    
            photoOfAllDishes.snp.makeConstraints { make in
                           make.top.equalTo(card)
                           make.leading.trailing.equalTo(card)
                           make.bottom.equalTo(card.snp.bottom).offset(-40)
                       }
    
            contentView.addSubview(card)
        }
    
  
    
}

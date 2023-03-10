//
//  MyCustomCollectionViewCell.swift
//  CulinaryWay
//
//  Created by MacBook Air on 17.02.2023.
//

import UIKit
import CollectionViewPagingLayout

protocol MyCustomCollectionViewCellProtocol {
    func apply(photos: UIImage)
    func applyLabel(text: String)
    func apply(spiceLabel: String)
}


class MyCustomCollectionViewCell: UICollectionViewCell, ScaleTransformView, MyCustomCollectionViewCellProtocol {
    
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
    
     lazy var photoOfAllDishes: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
     lazy var dishesLabel: UILabel = {
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        dishesLabel.text = nil
        selectLabel.isHidden = isAtEditState
    }
    
    func apply(photos: UIImage) {
        self.photoOfAllDishes.image = photos
    }
    
    func applyLabel(text: String) {
        self.dishesLabel.text = text
    }
    
    func setup(cell: MyCustomCollectionViewCell) {
        cell.layer.shadowRadius = 6.0
        cell.layer.shadowOffset = CGSize(width: 2, height: 2)
        cell.layer.shadowOpacity = 0.8
        cell.layer.shadowColor = .init(red: 10/255, green: 12/255, blue: 11/255, alpha: 1)
    }
    
    func apply(spiceLabel: String) {
        self.dishesLabel.text = spiceLabel
    }
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
 
    var scaleOptions: ScaleTransformViewOptions {
        .layout(.cylinder)
    }
    
    lazy var card: UIView = {
        let cardFrame = CGRect(
            x: 0,
            y: 20,
            width: frame.width,
            height: frame.height - 70
        )
       let card = UIView(frame: cardFrame)
        card.clipsToBounds = true
        card.layer.masksToBounds = true
        card.layer.cornerRadius = 20
        return card
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        card.addSubview(photoOfAllDishes)
        card.addSubview(dishesLabel)
        dishesLabel.snp.makeConstraints { make in
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

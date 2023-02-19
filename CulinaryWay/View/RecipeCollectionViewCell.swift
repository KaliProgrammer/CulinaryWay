//
//  BeansCollectionViewCell.swift
//  CulinaryWay
//
//  Created by MacBook Air on 15.12.2022.
//

import UIKit
import SnapKit

//class RecipeCollectionViewCell: UICollectionViewCell {
//    static let identifier = "RecipeCollectionViewCell"
//
////    var isAtEditState: Bool = false {
////        didSet {
////            selectLabel.isHidden = !isAtEditState
////        }
////    }
////
////    override var isSelected: Bool {
////        didSet {
////            if isAtEditState {
////                selectLabel.backgroundColor = isSelected ? UIColor.purple : UIColor.black.withAlphaComponent(0.5)
////
////            }
////        }
////    }
//
//
//    private lazy var recipeLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .black
//        label.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
//        label.textAlignment = .center
//        label.numberOfLines = 0
//        label.clipsToBounds = true
//        if (UIDevice.current.userInterfaceIdiom == .pad) {
//            label.font = UIFont.systemFont(ofSize: 40, weight: .medium)
//        } else {
//            label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
//        }
//        return label
//    }()
//
//   private lazy var recipeImage: UIImageView = {
//        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFill
////        imageView.clipsToBounds = true
//
//        return imageView
//    }()
//
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        contentView.addSubview(recipeImage)
//        contentView.layer.cornerRadius = 28
//
//        contentView.layer.masksToBounds = true
//        contentView.clipsToBounds = true
//    }
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        recipeLabel.text = nil
//    }
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        recipeImage.snp.makeConstraints { make in
//            make.top.equalTo(self.contentView)
//            make.leading.trailing.equalTo(self.contentView)
//            make.bottom.equalTo(self.contentView.snp.bottom).offset(-60)
//        }
//    }
//
//
//    func setupBeansLabel() {
//       self.contentView.addSubview(recipeLabel)
//        recipeLabel.snp.makeConstraints { make in
//            make.top.equalTo(recipeImage.snp.bottom)
//            make.height.equalTo(60)
//            make.leading.trailing.equalTo(self.contentView)
//        }
//   }
//
//    func setOpacity() {
//        self.recipeImage.alpha = 0.6
//    }
//
//    func setup(cell: RecipeCollectionViewCell) {
//        cell.setupBeansLabel()
//        cell.layer.cornerRadius = 20
//        cell.layer.shadowRadius = 5
//        cell.layer.shadowOffset = CGSize(width: 2, height: 2)
//        cell.layer.shadowOpacity = 1
//        cell.layer.shadowColor = .init(red: 15/255, green: 14/255, blue: 20/255, alpha: 1)
//
//    }
//    func apply(beansLabel: String) {
//        self.recipeLabel.text = beansLabel
//    }
//
//    func apply(beansImage: UIImage) {
//        self.recipeImage.image = beansImage
//    }
//
//}

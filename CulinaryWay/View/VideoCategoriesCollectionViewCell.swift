//
//  VideoCategoriesCollectionViewCell.swift
//  CulinaryWay
//
//  Created by MacBook Air on 24.02.2023.
//

import Foundation
import CollectionViewPagingLayout
import UIKit

class VideoCategoriesCollectionViewCell: UICollectionViewCell, SnapshotTransformView {
  
    lazy var videoCategoryPhoto: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    static let identifier = "VideoCategoriesCollectionViewCell"
    
    private lazy var videoCategoryLabel: UILabel = {
        let myLabel = UILabel()
        myLabel.textAlignment = .center
        myLabel.textColor = .white
        myLabel.font = UIFont.systemFont(ofSize: 19, weight: .semibold)
        return myLabel
    }()
    
    func apply(photo: UIImage) {
        self.videoCategoryPhoto.image = photo
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        videoCategoryLabel.text = nil
    }
    func apply(videoCategoryLabel: String, color: UIColor) {
        self.videoCategoryLabel.text = videoCategoryLabel
        self.videoCategoryLabel.backgroundColor = color
    }
    
    var snapshotOptions: SnapshotTransformViewOptions {
        .layout(.space)
    }
    
    
    var card: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        
        let cardFrame = CGRect(
            x: 65,
            y: 0,
            width: frame.width - 100,
            height: frame.height - 140
        )
        card = UIView(frame: cardFrame)
        card.clipsToBounds = true
        card.layer.masksToBounds = true
        card.layer.cornerRadius = 20
        
        card.addSubview(videoCategoryPhoto)
        card.addSubview(videoCategoryLabel)
        videoCategoryLabel.snp.makeConstraints { make in
            videoCategoryLabel.snp.makeConstraints { make in
                make.height.equalTo(40)
                make.leading.trailing.equalTo(self.card)
                make.bottom.equalTo(card.snp.bottom)
            }
            videoCategoryPhoto.snp.makeConstraints { make in
                make.top.equalTo(card)
                make.leading.trailing.equalTo(card)
                make.bottom.equalTo(card.snp.bottom).offset(-40)
            }
            
        }
        contentView.addSubview(card)
    }
    
}

//
//  SpiceCollectionViewCell.swift
//  CulinaryWay
//
//  Created by MacBook Air on 17.02.2023.
//

import UIKit
import SnapKit
import CollectionViewPagingLayout

class SpiceCollectionViewCell: UICollectionViewCell, SnapshotTransformView {
    
    lazy var spicesPhoto: UIImageView = {
       let imageView = UIImageView()
       imageView.contentMode = .scaleAspectFill
       return imageView
   }()
       
    private lazy var spiceLabel: UILabel = {
        let myLabel = UILabel()
        myLabel.textAlignment = .center
        myLabel.textColor = .white
        myLabel.font = UIFont.systemFont(ofSize: 19, weight: .semibold)
        return myLabel
    }()
 
    func apply(photo: UIImage) {
        self.spicesPhoto.image = photo
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        spiceLabel.text = nil
    }
    func apply(spiceLabel: String, color: UIColor) {
        self.spiceLabel.text = spiceLabel
        self.spiceLabel.backgroundColor = color
    }
 
    var snapshotOptions: SnapshotTransformViewOptions {
        .layout(.tiles)
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
        
        card.addSubview(spicesPhoto)
        card.addSubview(spiceLabel)
        spiceLabel.snp.makeConstraints { make in
            spiceLabel.snp.makeConstraints { make in
                make.height.equalTo(40)
                make.leading.trailing.equalTo(self.card)
                make.bottom.equalTo(card.snp.bottom)
            }
            spicesPhoto.snp.makeConstraints { make in
                make.top.equalTo(card)
                make.leading.trailing.equalTo(card)
                make.bottom.equalTo(card.snp.bottom).offset(-40)
            }
        }
        contentView.addSubview(card)
    }
}

//
//  SpiceCollectionViewCell.swift
//  CulinaryWay
//
//  Created by MacBook Air on 17.02.2023.
//

import UIKit
import SnapKit

class SpiceCollectionViewCell: UICollectionViewCell {
    static let identifier = "SpiceCollectionViewCell"
    
    private lazy var spiceLabel: UILabel = {
        let myLabel = UILabel()
        myLabel.textAlignment = .center
        myLabel.textColor = .white
        myLabel.font = UIFont.systemFont(ofSize: 19, weight: .semibold)
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        return myLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(spiceLabel)
        spiceLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.leading.equalTo(contentView.snp.leading)
            make.trailing.equalTo(contentView.snp.trailing)
            make.bottom.equalTo(contentView.snp.bottom)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        spiceLabel.text = nil
    }
    func apply(spiceLabel: String, color: UIColor, cornerRadius: CGFloat) {
        self.spiceLabel.text = spiceLabel
        self.backgroundColor = color
        self.layer.cornerRadius = cornerRadius
    }
}

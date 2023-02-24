//
//  FirstBeanDishView.swift
//  CulinaryWay
//
//  Created by MacBook Air on 18.12.2022.
//

import Foundation
import UIKit
import SnapKit

class RecipeView: UIView {
    
    lazy var heartButton: UIButton = {
      let heartButton = UIButton()
        heartButton.tintColor = .red
        heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
        return heartButton
    }()
    
     lazy var dishImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 18
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

     lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.backgroundColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupText()
        setupImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     func setupImage() {
         self.addSubview(dishImage)
         
        NSLayoutConstraint.activate([
            dishImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            dishImage.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            dishImage.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            dishImage.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
     func setupText() {
           self.addSubview(descriptionLabel)

        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 250),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            descriptionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),

        ])
    }
}

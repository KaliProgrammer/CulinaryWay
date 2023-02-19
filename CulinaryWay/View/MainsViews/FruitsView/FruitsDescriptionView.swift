//
//  FruitsDescriptionView.swift
//  CulinaryWay
//
//  Created by MacBook Air on 22.12.2022.
//

import UIKit

class FruitsDescriptionView: UIView {
    
    lazy var  stackView: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 10.0
        stack.axis = .vertical
        return stack
    }()

         lazy var fruitImage: UIImageView = {
            let imageView = UIImageView()
            imageView.layer.cornerRadius = 18
            imageView.contentMode = .scaleAspectFill
            return imageView
        }()
        
         lazy var nameLabel: UILabel = {
            let label = UILabel()
            label.numberOfLines = 0
            label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            label.backgroundColor = .white
            return label
        }()

    lazy var familyLabel: UILabel = {
       let label = UILabel()
       label.numberOfLines = 0
       label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
       label.backgroundColor = .white
       return label
   }()

    lazy var proteinLabel: UILabel = {
       let label = UILabel()
       label.numberOfLines = 0
       label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
       label.backgroundColor = .white
       return label
   }()

    lazy var fatLabel: UILabel = {
       let label = UILabel()
       label.numberOfLines = 0
       label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
       label.backgroundColor = .white
       return label
   }()

    lazy var caloriesLabel: UILabel = {
       let label = UILabel()
       label.numberOfLines = 0
       label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
       label.backgroundColor = .white
       return label
   }()

    lazy var sugarLabel: UILabel = {
       let label = UILabel()
       label.numberOfLines = 0
       label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
       label.backgroundColor = .white
       return label
   }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupImage()

            
            configureStackView()
            
            AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    func configureStackView() {
        self.addSubview(stackView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(familyLabel)
        stackView.addArrangedSubview(proteinLabel)
        stackView.addArrangedSubview(fatLabel)
        stackView.addArrangedSubview(caloriesLabel)
        stackView.addArrangedSubview(sugarLabel)

        stackView.snp.makeConstraints { make in
            make.leading.equalTo(self).offset(20)
            make.trailing.equalTo(self)
            make.top.equalTo(fruitImage.snp.bottom).offset(20)
            make.bottom.equalTo(self.safeAreaLayoutGuide).offset(-100)
        }
    }
        
         func setupImage() {
            self.addSubview(fruitImage)
             fruitImage.snp.makeConstraints { make in
                 make.leading.equalTo(self.safeAreaLayoutGuide).offset(30)
                 make.trailing.equalTo(self.safeAreaLayoutGuide).offset(-30)
                 make.top.equalTo(self.safeAreaLayoutGuide).offset(50)
                 make.bottom.equalTo(self.safeAreaLayoutGuide).offset(-300)
             }
             
        }
}

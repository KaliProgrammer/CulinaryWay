//
//  FruitsDescriptionViewController.swift
//  CulinaryWay
//
//  Created by MacBook Air on 22.12.2022.
//

import UIKit

class FruitsDescriptionViewController: UIViewController {
    
    var selectedIndex = 0
    var fruitsView = FruitsDescriptionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFruitsView()
        view.backgroundColor = .white
        
    }
    
    func setupFruitsView() {
        view.addSubview(fruitsView)
        fruitsView.snp.makeConstraints { make in
            make.leading.equalTo(self.view).offset(16)
            make.trailing.equalTo(self.view).offset(-16)
            make.top.equalTo(self.view)
            make.bottom.equalTo(self.view)
        }
    }
 
    func loadImage(image: UIImage) {
        fruitsView.fruitImage.image = image
    }
    func apply(textName: String) {
        fruitsView.nameLabel.text = textName
    }
    func apply(textFamily: String) {
        fruitsView.familyLabel.text = "Семейство: \(textFamily)"
    }
    func apply(protein: Double) {
        fruitsView.proteinLabel.text = String("Белок: \(protein)")
    }
    func apply(fat: Double) {
        fruitsView.fatLabel.text = String("Жиры: \(fat)")
    }
    func apply(calories: Int) {
        fruitsView.caloriesLabel.text = String("Калории: \(calories)")
    }
    func apply(sugar: Double) {
        fruitsView.sugarLabel.text = String("Сахар: \(sugar)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.all)
    }
}

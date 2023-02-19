//
//  DalViewController.swift
//  CulinaryWay
//
//  Created by MacBook Air on 18.12.2022.
//

import UIKit
import CoreData
import SnapKit


protocol AddRecipeDelegate {
    func addRecipe(recipe: Int)
}


class RecipeViewController: UIViewController {
    
    var buttonIsEnabled: Bool = true
    var buttonIsHidden: Bool = false
    
    var selectedIndex: Int = 0
    
    var delegate: AddRecipeDelegate?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var contentView = RecipeView()
    
    private lazy var contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 1500)
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.backgroundColor = .white
        scrollView.contentSize = contentSize
        scrollView.frame = self.view.bounds
        scrollView.autoresizingMask = .flexibleHeight
        scrollView.bounces = true
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        setNavigationItem()
        setupContentView()
        rightButton(isEnabled: self.buttonIsEnabled, buttonIsHidden: self.buttonIsHidden)
    }
    
    func setNavigationItem() {
        
        let button = UIButton(type: .custom)
        let congiguration = UIImage.SymbolConfiguration(scale: .large)
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.setPreferredSymbolConfiguration(congiguration, forImageIn: .normal)
        button.tintColor = .red
        //button.backgroundColor = .orange
        //button.frame = CGRect(x: 0.0, y: 0.0, width: 35.0, height: 35.0)
        button.addTarget(self, action: #selector(addItems), for: .touchUpInside)
        
        
        button.setTitleColor(.red, for: .normal)
        let barButtonItem = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = barButtonItem
        
    }
    
    //ADD BUTTON
    
    @objc func addItems(sender: UIButton) {
        guard dishNames.isEmpty else {
            createItem(image: dishNames[0].image, description: dishNames[0].dish)
            sender.isSelected = !sender.isSelected
            
            if sender.isSelected {
                sender.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                sender.tintColor = .red
                let count = savedRecipe.count
                delegate?.addRecipe(recipe: count)
                dishNames.removeAll()
               
            }
            return
        }
        
//        sender.isEnabled = false
     
//                else {
//                    sender.setImage(UIImage(systemName: "heart"), for: .normal)
//                }
        
    }
    
    //    private func animate() {
    //        UIView.animate(withDuration: 1) {
    //          //  self.contentView.isOpaque = false
    //            self.contentView.frame = CGRect(x: -500, y: -500, width: 20, height: 20)
    //        } completion: { done in
    //            if done {
    //                UIView.animate(withDuration: 1) {
    ////                    self.contentView.frame = CGRect(x: -500, y: -500, width: 50, height: 50)
    ////                   self.contentView.isOpaque = false
    //                }
    //            }
    //        }
    //
    //    }
    //
    
    
    private func createItem(image: String, description: String) {
        let newItem = Dish(context: context)
        newItem.image = image
        newItem.recipe = description
        
        if savedRecipe.contains(where: { $0.image == newItem.image }) {
            let alert = UIAlertController(title: "Упс", message: "Такой рецепт уже был сохранён!", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel)
            alert.addAction(action)
            self.present(alert, animated: true)
            return
        }
        
        savedRecipe.append(newItem)
        do {
            try self.context.save()
        } catch let error as NSError {
            print(error)
        }
    }
    
    func setupContentView() {
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            
            contentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
    }
    
    func loadImage(image: UIImage) {
        contentView.dishImage.image = image
    }
    func apply(textDescription: String) {
        contentView.descriptionLabel.text = textDescription
    }
    
    func rightButton(isEnabled: Bool, buttonIsHidden: Bool) {
        self.navigationItem.rightBarButtonItem?.isEnabled = isEnabled
        self.navigationItem.rightBarButtonItem?.isHidden = buttonIsHidden
    }
}

extension UIViewController {
    
    func pushView(viewController: UIViewController) {
        
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = .fade
        self.view.window?.layer.add(transition, forKey: kCATransition)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

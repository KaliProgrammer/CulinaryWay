//
//  RecipeViewModel.swift
//  CulinaryWay
//
//  Created by MacBook Air on 19.02.2023.
//

import Foundation
import UIKit
import CoreData

protocol RecipeProtocol: AnyObject {
    func addItems(sender: UIButton, viewController: RecipeViewController)
    func createItem(image: String, description: String, viewController: RecipeViewController)
    var delegate: AddRecipeDelegate? { get set }
    var context: NSManagedObjectContext { get set }
}

protocol ApplyView {
    func loadImage(image: UIImage, from view: RecipeView)
    func apply(textDescription: String, from view: RecipeView)
}

class RecipeViewModel: RecipeProtocol, ApplyView {
    var contentView = RecipeView()
    
    func loadImage(image: UIImage, from view: RecipeView) {
        view.dishImage.image = image
    }
    func apply(textDescription: String, from view: RecipeView) {
        view.descriptionLabel.text = textDescription
    }
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var delegate: AddRecipeDelegate?
    
    func createItem(image: String, description: String, viewController: RecipeViewController) {
        let newItem = Dish(context: context)
        newItem.image = image
        newItem.recipe = description
        
        if savedRecipe.contains(where: { $0.image == newItem.image }) {
            let alert = UIAlertController(title: "Упс", message: "Такой рецепт уже был сохранён!", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel)
            alert.addAction(action)
            viewController.present(alert, animated: true)
            return
        }
        
        savedRecipe.append(newItem)
        do {
            try self.context.save()
        } catch let error as NSError {
            print(error)
        }
    }
    
    func addItems(sender: UIButton, viewController: RecipeViewController) {
        guard dishNames.isEmpty else {
            createItem(image: dishNames[0].image, description: dishNames[0].dish, viewController: viewController)
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
    }
}

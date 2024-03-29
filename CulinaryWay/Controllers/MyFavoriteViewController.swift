//
//  MyFavoriteViewController.swift
//  CulinaryWay
//
//  Created by MacBook Air on 14.12.2022.
//

import UIKit
import CoreData
import SnapKit
import Lottie

class MyFavoriteViewController: MainViewController {
    
//    let noRecipeView = NoRecipesView()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    lazy var emptyStateMessage: UILabel = {
          let messageLabel = UILabel()
          messageLabel.textColor = .black
          messageLabel.text = "Нет рецептов"
          messageLabel.numberOfLines = 0;
          messageLabel.textAlignment = .center;
          messageLabel.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
          messageLabel.sizeToFit()
          return messageLabel
      }()
    
    private var animationView: LottieAnimationView?
    
//    lazy var noRecipeImage: UIImageView = {
//        let icon = UIImageView()
//        icon.image = UIImage(named: "noRecipeIcon1")
//        return icon
//
//    }()
     
    private lazy var gesture: UILongPressGestureRecognizer = {
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressGesture))
        return gesture
    }()
    
    @objc private func handleLongPressGesture() {
        switch gesture.state {
        case .began:
            guard let targetIndexPath = mainView.collectionView.indexPathForItem(at: gesture.location(in: mainView.collectionView)) else {
                return
            }
            mainView.collectionView.beginInteractiveMovementForItem(at: targetIndexPath)
        case .changed:
            mainView.collectionView
                .updateInteractiveMovementTargetPosition(gesture.location(in: mainView.collectionView))
            
        case .ended:
            mainView.collectionView.endInteractiveMovement()
        default:
            mainView.collectionView.cancelInteractiveMovement()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.largeTitleDisplayMode = .always
        mainView.collectionView.addGestureRecognizer(gesture)
        fetchList()
        setupAnimationView()
 
    }
    
    func setupAnimationView() {
        animationView = .init(name: "samosa")
        animationView!.frame = view.frame
        animationView!.contentMode = .scaleAspectFit
        animationView!.loopMode = .loop
        animationView!.animationSpeed = 1.0
        mainView.addSubview(animationView!)
        animationView!.play()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if isEditing {
            editButtonItem.title = "Готово"
        }
        super.viewWillAppear(animated)
        addEditButton()
        DispatchQueue.main.async {
            self.mainView.collectionView.reloadData()
        }
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
    }
    
    //CD
    private func fetchList() {
        do {
            savedRecipe = try context.fetch(Dish.fetchRequest())
            DispatchQueue.main.async {
                self.mainView.collectionView.reloadData()
            }
        } catch let error as NSError {
            print(error)
        }
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        mainView.collectionView.allowsMultipleSelection = editing
        
        mainView.collectionView.indexPathsForSelectedItems?.forEach({ (indexPath) in
            mainView.collectionView.deselectItem(at: indexPath, animated: false)
        })
        mainView.collectionView.indexPathsForVisibleItems.forEach { (indexPath) in
            let cell = mainView.collectionView.cellForItem(at: indexPath) as! MyCell
            cell.isAtEditState = editing
           
            editing ? addDeleteButton() : navigationItem.setRightBarButton(nil, animated: true)
      
        }
        self.editButtonItem.title = editing ? "Готово" : "Изменить"
        self.mainView.collectionView.reloadData()
    }
    
    private func addEditButton() {
        if !savedRecipe.isEmpty {
            navigationItem.leftBarButtonItem = editButtonItem
            editButtonItem.title = "Изменить"
            editButtonItem.tintColor = .systemOrange
          //  self.mainView.collectionView.reloadData()
        }

    }
    
    private func addDeleteButton() {
        let rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(deleteAction))
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    @objc func deleteAction() {
        if let selectedItems = mainView.collectionView.indexPathsForSelectedItems {
            let items = selectedItems.map{ $0.item }.sorted().reversed()
            for item in items {
                deleteItem(item: savedRecipe[item])
                savedRecipe.remove(at: item)
            }
            mainView.collectionView.deleteItems(at: selectedItems)
            
            if savedRecipe.isEmpty {
                navigationItem.setRightBarButton(nil, animated: true)
                navigationItem.setLeftBarButton(nil, animated: true)
                isEditing = !isEditing
            }
        }
    }
    
    func deleteItem(item: Dish) {
        
        context.delete(item)
        do {
            try context.save()
        } catch let error as NSError {
            print(error)
        }
    }
    
    override func setupNavigation() {
        super.setupNavigation()
        self.navigationItem.title = "Мои рецепты"
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if savedRecipe.count == 0 {
            showEmptyState()
        }
        else {
            hideEmptyState()
        }
      return savedRecipe.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as? MyCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            return cell
        }
        
        if let picture = savedRecipe[indexPath.row].image {
            if let customImage = UIImage(named: picture) {
                cell.apply(photos: customImage)
                cell.applyLabel(text: picture)
            }
        }
        cell.setup(cell: cell)
        cell.layer.cornerRadius = 28
        cell.setupSelectLabel()

        cell.isAtEditState = isEditing
         return cell
    }
    

    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard isEditing else  {
            let viewController = RecipeViewController()
            
            viewController.selectedIndex = indexPath.row
            
            if let description = savedRecipe[indexPath.row].recipe {
                viewController.apply(textDescription: description)
                
                
                
                viewController.buttonIsEnabled = false
                viewController.buttonIsHidden = true
                viewController.rightButton(isEnabled: viewController.buttonIsEnabled, buttonIsHidden: viewController.buttonIsHidden)

                
                if let dalImage = savedRecipe[indexPath.row].image {
                    viewController.loadImage(image: UIImage(named: dalImage)!)
                    storedImages.removeAll()
                }
            }
                pushView(viewController: viewController)
                return
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if isEditing {
            editButtonItem.title = "Готово"
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if isEditing {
            editButtonItem.title = "Готово"
        }
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.all)
    }
    
    func showEmptyState() {
        mainView.addSubview(animationView!)
        //mainView.addSubview(noRecipeImage)
        mainView.addSubview(emptyStateMessage)

//        noRecipeImage.snp.makeConstraints { make in
//            make.centerX.equalTo(self.view)
//            make.centerY.equalTo(self.view).offset(-40)
//            make.height.width.equalTo(100)
       // }
        emptyStateMessage.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.centerY.equalTo(self.view).offset(140)
        }
    }
        func hideEmptyState() {
            animationView?.removeFromSuperview()
           // noRecipeImage.removeFromSuperview()
            emptyStateMessage.removeFromSuperview()
        }
    
     func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
     func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
         let item = savedRecipe.remove(at: sourceIndexPath.row)
         savedRecipe.insert(item, at: destinationIndexPath.row)
    }
    
}

extension MyFavoriteViewController: AddRecipeDelegate {
    func addRecipe(recipe: Int) {
        self.addEditButton()
        DispatchQueue.main.async {
            self.mainView.collectionView.reloadData()
        }
    
    }
}

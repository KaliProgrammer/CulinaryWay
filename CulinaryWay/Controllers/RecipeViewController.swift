//
//  DalViewController.swift
//  CulinaryWay
//
//  Created by MacBook Air on 18.12.2022.
//

import UIKit
import SnapKit
import Combine

protocol AddRecipeDelegate {
    func addRecipe(recipe: Int)
}

class RecipeViewController: UIViewController {
    
    let viewModel = RecipeViewModel()
    var cancellables = Set<AnyCancellable>()
    
    var buttonIsEnabled: Bool = true
    var buttonIsHidden: Bool = false
    
    var selectedIndex: Int = 0
    
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
        button.addTarget(self, action: #selector(addItems), for: .touchUpInside)
        button.setTitleColor(.red, for: .normal)
        let barButtonItem = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = barButtonItem
    }
        
    @objc func addItems(sender: UIButton) {
        viewModel.addItems(sender: sender, viewController: self)
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

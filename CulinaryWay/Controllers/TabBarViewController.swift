//
//  TabBarViewController.swift
//  CulinaryWay
//
//  Created by MacBook Air on 14.12.2022.
//

import UIKit

class TabBarViewController: UITabBarController {

private lazy var mainViewController: UINavigationController = {
    let controller = UINavigationController(rootViewController: MainViewController())
    controller.tabBarItem.image = UIImage(systemName: "house.fill")
    controller.tabBarItem.title = "Главная"
    controller.navigationBar.prefersLargeTitles = true
    controller.navigationBar.backgroundColor = .white
    return controller
}()

private lazy var spicesViewController: UINavigationController = {
    let controller = UINavigationController(rootViewController: SpicesViewController())
    controller.tabBarItem.image = UIImage(systemName: "leaf.fill")
    controller.tabBarItem.title = "Специи"
    controller.navigationBar.prefersLargeTitles = true
    controller.navigationBar.backgroundColor = .white
    return controller
}()

private lazy var videoViewController: UINavigationController = {
    let controller = UINavigationController(rootViewController: VideoCategoriesViewController())
    controller.tabBarItem.image = UIImage(systemName: "play.rectangle.on.rectangle.fill")
    controller.tabBarItem.title = "Видео"
    controller.navigationBar.prefersLargeTitles = true
    controller.navigationBar.backgroundColor = .white
    return controller
}()
    
//    private lazy var fruitsViewController: UINavigationController = {
//        let controller = UINavigationController(rootViewController: FruitsViewController())
//        controller.tabBarItem.image = UIImage(systemName: "sun.max.fill")
//        controller.tabBarItem.title = "Фрукты"
//        controller.navigationBar.prefersLargeTitles = true
//        controller.navigationBar.backgroundColor = .white
//        return controller
//    }()

private lazy var myFavoriteViewController: UINavigationController = {
    let controller = UINavigationController(rootViewController: MyFavoriteViewController())
    controller.tabBarItem.image = UIImage(systemName: "bookmark.fill")
    controller.tabBarItem.title = "Избранное"
    controller.navigationBar.backgroundColor = .white
    controller.navigationBar.prefersLargeTitles = true
    return controller
}()

    
override func viewDidLoad() {
    super.viewDidLoad()
    
    
    self.tabBar.tintColor = .orange
    
    setViewControllers([mainViewController, spicesViewController, videoViewController, myFavoriteViewController], animated: true)

         UITabBar.appearance().barTintColor = .white
    UITabBar.appearance().tintColor = .systemOrange
    
         UITabBar.appearance().isTranslucent = true
         
         if #available(iOS 15.0, *) {
             let appearance = UITabBarAppearance()
             appearance.configureWithOpaqueBackground()
             appearance.backgroundColor = .white
             UITabBar.appearance().standardAppearance = appearance
             UITabBar.appearance().scrollEdgeAppearance = UITabBar.appearance().standardAppearance
     
             let navigationBarAppearance = UINavigationBarAppearance()
             navigationBarAppearance.configureWithOpaqueBackground()
             UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
         }
    }
}

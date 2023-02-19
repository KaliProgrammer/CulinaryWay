//
//  FruitsViewController.swift
//  CulinaryWay
//
//  Created by MacBook Air on 15.12.2022.
//

import UIKit
import Combine

class FruitsViewController: MainViewController {

    private let networkLayer: NetworkLayer = URLSessionLayer()
    private var allFruits: [FruitData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        
        if !NetworkMonitor.shared.isConnected {
            let alert = UIAlertController(title: "Нет интернета", message: "Убедитесь, что вы подключены к Wi-Fi", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel)
            alert.addAction(action)
            self.present(alert, animated: true)
        }
        
        
        
        
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        
        let url = URL(string: "https://www.fruityvice.com/api/fruit/all")
        guard let url else {
            return
        }
        let urlRequest = URLRequest(url: url)
        let task = session.dataTask(with: urlRequest) {[weak self] data, response, error in
            guard let data else {
                print(error?.localizedDescription ?? "error is absent")
                return
            }
            let fruits = try? JSONDecoder().decode([FruitData].self, from: data)
            DispatchQueue.main.async {
                self?.allFruits = fruits!
            }
        }
        task.resume()
        
        networkLayer.getAllFruits { [weak self] result in
            DispatchQueue.main.async {
                do {
                    self?.allFruits = try result.get()
                } catch  {
                    print(error)
                }
            }
        }
    }
   
    
    override func setupNavigation() {
        super.setupNavigation()
        self.navigationItem.title = "Фрукты"
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        fruitPictures.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FruitCollectionViewCell.identifier, for: indexPath) as? FruitCollectionViewCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            return cell
        }
        
        if let cellImage = UIImage(named: fruitPictures[indexPath.row]) {
             cell.apply(photos: cellImage)
         }
        cell.setup(cell: cell)
        
        
         return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if NetworkMonitor.shared.isConnected {
            let viewController = FruitsDescriptionViewController()
            viewController.selectedIndex = indexPath.row
            viewController.apply(textName: allFruits[indexPath.row].name ?? "")
            viewController.apply(textFamily: allFruits[indexPath.row].family ?? "")
            viewController.apply(protein: allFruits[indexPath.row].nutritions?.protein ?? 0.0)
            viewController.apply(fat: allFruits[indexPath.row].nutritions?.fat ?? 0.0)
            viewController.apply(calories: allFruits[indexPath.row].nutritions?.calories ?? 0)
            viewController.apply(sugar: allFruits[indexPath.row].nutritions?.sugar ?? 0.0)
            
            if let fruitImage = UIImage(named: fruitPictures[indexPath.row]) {
                viewController.loadImage(image: fruitImage)
            }
            
            navigationController?.pushViewController(viewController, animated: true)
        }
        else
        {
            return
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.all)
    }
}


extension FruitsViewController: URLSessionDelegate {
    public func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {

        let urlCredential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
         completionHandler(.useCredential, urlCredential)
      }
}

//
//  SpicesViewController.swift
//  CulinaryWay
//
//  Created by MacBook Air on 14.12.2022.
//

import UIKit
import SnapKit

class SpicesViewController: UIViewController {

    let spicesView = SpicesView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        spicesView.navigationCollection.delegate = self
        spicesView.navigationCollection.dataSource = self
        setupNavigationBar(title: "Специи")
        setupView()
    }
    
    func setupNavigationBar(title: String) {
        self.navigationItem.title = title
    }
    
    private func setupView() {
        self.view.addSubview(spicesView)
        spicesView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

extension SpicesViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        spicesCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SpiceCollectionViewCell.identifier, for: indexPath) as! SpiceCollectionViewCell
        let categoryName = spicesCategories[indexPath.row].spicesCategory
        if indexPath.row == 0 {
            cell.apply(spiceLabel: categoryName, color: .orange, cornerRadius: 28)
        }
        else {
             cell.apply(spiceLabel: categoryName, color: .red, cornerRadius: 28)
         }
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = SpicesDescriptionViewController()
        switch indexPath.row {
        case 0:
            viewController.navigationItem.title = "Холодные специи"
            self.navigationController?.present(viewController, animated: true)
        case 1:
            viewController.navigationItem.title = "Горячие специи"
            self.navigationController?.present(viewController, animated: true)
        default:
            return
        }
    }
    
    
}

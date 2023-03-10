//
//  VideoViewController.swift
//  CulinaryWay
//
//  Created by MacBook Air on 14.12.2022.
//

import UIKit
import youtube_ios_player_helper


class VideoCategoriesViewController: UIViewController {
    
    let videoView = SpicesView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        videoView.navigationCollection.delegate = self
        videoView.navigationCollection.dataSource = self
        setupNavigationBar(title: "Видео")
        setupView()
    }
    func setupNavigationBar(title: String) {
        self.navigationItem.title = title
    }
    
    private func setupView() {
        self.view.addSubview(videoView)
        videoView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
//
//    let videoView = VideoView()
//
//    var dataSourceArray: [String] = []
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        setupNavigationBar(title: "Видео")
//        videoView.videoCollection.delegate = self
//        videoView.videoCollection.dataSource = self
//
//        setupView()
//        videoView.setupCollection()
//        dataSourceArray = cookingVideos
//
//
//        if !NetworkMonitor.shared.isConnected {
//            let alert = UIAlertController(title: "Нет интернета", message: "Убедитесь, что вы подключены к Wi-Fi", preferredStyle: .alert)
//            let action = UIAlertAction(title: "Ok", style: .cancel)
//            alert.addAction(action)
//            self.present(alert, animated: true)
//        }
//
//    }
//
//
//
//    func setupNavigationBar(title: String) {
//        self.navigationItem.title = title
//        self.navigationItem.largeTitleDisplayMode = .always
//    }
//
//    private func setupView() {
//        view.addSubview(videoView)
//        videoView.snp.makeConstraints { make in
//            make.leading.equalTo(self.view.safeAreaLayoutGuide)
//            make.trailing.equalTo(self.view.safeAreaLayoutGuide)
//            make.top.equalTo(self.view)
//            make.bottom.equalTo(self.view)
//        }
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.all)
//    }
//
//}
//
//extension VideoViewController: UICollectionViewDelegate, UICollectionViewDataSource {
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        dataSourceArray.count
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VideosCollectionViewCell.identifier, for: indexPath) as? VideosCollectionViewCell else {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
//            return cell
//        }
//        DispatchQueue.main.async {
//            cell.loadVideo(with: self.dataSourceArray[indexPath.row])
//        }
//
//        return cell
//    }
//
//
}

extension VideoCategoriesViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        videoCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VideoCategoriesCollectionViewCell.reuseIdentifier, for: indexPath) as! VideoCategoriesCollectionViewCell
        let categoryName = videoCategories[indexPath.row].videoCategory
        if indexPath.row == 0 {
            
            cell.apply(videoCategoryLabel: categoryName, color: .orange)
            if let pictures = UIImage(named: "streetFood") {
                cell.apply(photo: pictures)
            }
        }
        else {
            cell.apply(videoCategoryLabel: categoryName, color: .orange)
            if let pictures = UIImage(named: "homeFood") {
                cell.apply(photo: pictures)
            }
         }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = VideoViewController()
        switch indexPath.row {
        case 0:
            viewController.dataSourceArray = streeFoodVideos
            viewController.navigationItem.title = "Уличная еда"
            self.navigationController?.pushViewController(viewController, animated: true)
        case 1:
            viewController.dataSourceArray = ourVideos
            viewController.navigationItem.title = "Домашние рецепты"
            self.navigationController?.pushViewController(viewController, animated: true)
        default:
            return
        }
    }
    
}

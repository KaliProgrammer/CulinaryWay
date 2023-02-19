//
//  VideoViewController.swift
//  CulinaryWay
//
//  Created by MacBook Air on 14.12.2022.
//

import UIKit
import youtube_ios_player_helper


class VideoViewController: UIViewController {
    
    let videoView = VideoView()
    
    var dataSourceArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationBar(title: "Видео")
        videoView.videoCollection.delegate = self
        videoView.videoCollection.dataSource = self
        
        setupView()
        videoView.setupCollection()
        dataSourceArray = cookingVideos
        
        
        if !NetworkMonitor.shared.isConnected {
            let alert = UIAlertController(title: "Нет интернета", message: "Убедитесь, что вы подключены к Wi-Fi", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel)
            alert.addAction(action)
            self.present(alert, animated: true)
        }

    }
    
  
    
    func setupNavigationBar(title: String) {
        self.navigationItem.title = title
        self.navigationItem.largeTitleDisplayMode = .always
    }
    
    private func setupView() {
        view.addSubview(videoView)
        videoView.snp.makeConstraints { make in
            make.leading.equalTo(self.view.safeAreaLayoutGuide)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.top.equalTo(self.view)
            make.bottom.equalTo(self.view)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.all)
    }
    
}

extension VideoViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSourceArray.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VideosCollectionViewCell.identifier, for: indexPath) as? VideosCollectionViewCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            return cell
        }
        DispatchQueue.main.async {
            cell.loadVideo(with: self.dataSourceArray[indexPath.row])
        }
           
        return cell
    }
    
    
}

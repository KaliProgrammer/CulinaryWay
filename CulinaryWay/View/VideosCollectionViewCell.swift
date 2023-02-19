//
//  VideosCollectionViewCell.swift
//  CulinaryWay
//
//  Created by MacBook Air on 26.01.2023.
//

import UIKit
import youtube_ios_player_helper
import ShimmerSwift

class VideosCollectionViewCell: UICollectionViewCell, YTPlayerViewDelegate {
    static let identifier = "VideosCollectionViewCell"

    private lazy var youtubePlayer: YTPlayerView = {
        let player = YTPlayerView()
        player.frame = contentView.bounds
        player.clipsToBounds = true
        player.layer.cornerRadius = 20
        player.delegate = self
        return player
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = contentView.bounds
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.backgroundColor = .systemGray
        return imageView
    }()
    
    private lazy var shimmeringView: ShimmeringView = {
        let shimmerView = ShimmeringView()
        shimmerView.frame = contentView.bounds
        shimmerView.isShimmering = true
        shimmerView.contentView = youtubePlayer
        return shimmerView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 20
        setupContent()
    }
    
    
    
    override func layoutSubviews() {
        contentView.addSubview(shimmeringView)
        super.layoutSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupContent() {
        contentView.addSubview(youtubePlayer)
    } 
}

extension VideosCollectionViewCell {
    
    func loadVideo(with id: String) {
        self.youtubePlayer.load(withVideoId: id, playerVars: ["playsinline": 1])
    }
    func playerViewPreferredInitialLoading(_ playerView: YTPlayerView) -> UIView? {
        imageView
    }
    
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        shimmeringView.isShimmering = false
    }
}

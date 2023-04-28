//
//  PlayerViewController.swift
//  PodcastSwift
//
//  Created by hakkı can şengönül on 28.04.2023.
//

import UIKit
class PlayerViewController: UIViewController {
     // MARK: - Propeties
    var episode: Episode
     // MARK: - Lifecycle
    init(episode: Episode) {
        self.episode = episode
        super.init(nibName: nil, bundle: nil)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
 // MARK: - Helpers
extension PlayerViewController{
    private func style(){
        view.backgroundColor = .red
        print(episode.title)
    }
    private func layout(){
        
    }
}

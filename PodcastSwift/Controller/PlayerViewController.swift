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
    private var mainStackView: UIStackView!
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.compact.down"), for: .normal)
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return button
    }()
    private let episodeImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.customMode()
        imageView.backgroundColor = .systemPurple
        return imageView
    }()
    private let sliderView: UISlider = {
       let slider = UISlider()
        slider.setThumbImage(UIImage(), for: .normal)
        return slider
    }()
    private let startLabel: UILabel = {
       let label = UILabel()
        label.text = "00:00"
        label.textAlignment = .left
        return label
    }()
    private let endLabel: UILabel = {
       let label = UILabel()
        label.text = "00:00"
        label.textAlignment = .right
        return label
    }()
    private var timerStackView: UIStackView!
    private let nameLabel: UILabel = {
       let label = UILabel()
        label.text = "name"
        label.textAlignment = .center
        label.numberOfLines = 2
        label.heightAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
        return label
    }()
    private let userLabel: UILabel = {
       let label = UILabel()
        label.text = "user"
        label.textAlignment = .center
        return label
    }()
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
        view.backgroundColor = .white
        
        timerStackView = UIStackView(arrangedSubviews: [startLabel,endLabel])
        timerStackView.axis = .horizontal
        
        mainStackView = UIStackView(arrangedSubviews: [closeButton, episodeImageView, sliderView, timerStackView, nameLabel, userLabel])
        mainStackView.axis = .vertical
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    private func layout(){
        view.addSubview(mainStackView)
        NSLayoutConstraint.activate([
            episodeImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            sliderView.heightAnchor.constraint(equalToConstant: 40),
            mainStackView.topAnchor.constraint(equalTo: view.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32)
        ])
    }
}

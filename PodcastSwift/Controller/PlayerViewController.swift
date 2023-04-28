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
    private var playStackView: UIStackView!
    private lazy var goForWardButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(systemName: "goforward.30"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        return button
    }()
    private lazy var goPlayButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(systemName: "play.fill"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        return button
    }()
    private lazy var goBackWardButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(systemName: "gobackward.15"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        return button
    }()
    private var volumeStackView: UIStackView!
    private let volumeSliderView: UISlider = {
       let slider = UISlider()
        return slider
    }()
    private let plusImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: "speaker.wave.3.fill")
        imageView.tintColor = .lightGray
        return imageView
    }()
    private let minusImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: "speaker.wave.1.fill")
        imageView.tintColor = .lightGray
        return imageView
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
        
        playStackView = UIStackView(arrangedSubviews: [UIView() ,goBackWardButton,UIView() ,goPlayButton,UIView(), goForWardButton, UIView() ])
        playStackView.axis = .horizontal
        playStackView.distribution = .fillEqually
        
        volumeStackView = UIStackView(arrangedSubviews: [minusImageView, volumeSliderView, plusImageView])
        volumeStackView.axis = .horizontal
        
        
        mainStackView = UIStackView(arrangedSubviews: [closeButton, episodeImageView, sliderView, timerStackView, nameLabel, userLabel, playStackView, volumeStackView])
        mainStackView.axis = .vertical
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    private func layout(){
        view.addSubview(mainStackView)
        NSLayoutConstraint.activate([
            episodeImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            sliderView.heightAnchor.constraint(equalToConstant: 40),
            playStackView.heightAnchor.constraint(equalToConstant: 60),
            mainStackView.topAnchor.constraint(equalTo: view.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16)
        ])
    }
}

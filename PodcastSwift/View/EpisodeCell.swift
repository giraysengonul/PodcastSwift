//
//  EpisodeCell.swift
//  PodcastSwift
//
//  Created by hakkı can şengönül on 1.04.2023.
//

import UIKit
class EpisodeCell: UITableViewCell {
     // MARK: - Properties
    private let episodeImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.customMode()
        imageView.backgroundColor  = .systemPurple
        return imageView
    }()
    private let pubDateLabel: UILabel = {
       let label = UILabel()
        label.textColor = .systemPurple
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "pubDateLabel"
        return label
    }()
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "titleLabel"
        label.numberOfLines = 2
        return label
    }()
    private let decriptionLabel: UILabel = {
       let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 2
        label.text = "decriptionLabel"
        return label
    }()
    private var stackView: UIStackView!
     // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
 // MARK: - Helpers
extension EpisodeCell{
    private func setup(){
        configureUI()
    }
    private func configureUI(){
        episodeImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(episodeImageView)
        NSLayoutConstraint.activate([
            episodeImageView.heightAnchor.constraint(equalToConstant: 100),
            episodeImageView.widthAnchor.constraint(equalToConstant: 100),
            episodeImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            episodeImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        stackView = UIStackView(arrangedSubviews: [pubDateLabel,titleLabel,decriptionLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: episodeImageView.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: episodeImageView.trailingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    
    
}

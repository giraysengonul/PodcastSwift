//
//  SearchCell.swift
//  PodcastSwift
//
//  Created by hakkı can şengönül on 29.03.2023.
//

import UIKit
import Kingfisher
class SearchCell: UITableViewCell {
     // MARK: - Properties
    var result: Podcast?{
        didSet{ configure() }
    }
    private let photoImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = .systemPurple
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    private let trackName: UILabel = {
       let label = UILabel()
        label.text = "trackName"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    private let artistName: UILabel = {
       let label = UILabel()
        label.text = "artistName"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    private let trackCount: UILabel = {
       let label = UILabel()
        label.text = "trackCount"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    private var stackView: UIStackView!
     // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
 // MARK: - Helpers
extension SearchCell{
    private func setup(){
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.layer.cornerRadius = 12
        stackView = UIStackView(arrangedSubviews: [trackName,artistName,trackCount])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    private func layout(){
        addSubview(photoImageView)
        addSubview(stackView)
        NSLayoutConstraint.activate([
            photoImageView.heightAnchor.constraint(equalToConstant: 80),
            photoImageView.widthAnchor.constraint(equalToConstant: 80),
            photoImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            
            stackView.centerYAnchor.constraint(equalTo: photoImageView.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 4),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    private func configure(){
        guard let result = self.result else { return }
        trackName.text = result.trackName
        trackCount.text = "\(result.trackCount ?? 0)"
        artistName.text = result.artistName
        photoImageView.kf.setImage(with: URL(string: result.artworkUrl600!))
    }
}

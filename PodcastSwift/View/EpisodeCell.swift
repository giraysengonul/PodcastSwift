//
//  EpisodeCell.swift
//  PodcastSwift
//
//  Created by hakkı can şengönül on 1.04.2023.
//

import UIKit
class EpisodeCell: UITableViewCell {
     // MARK: - Properties
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
        backgroundColor = .red
    }
}

//
//  EpisodeCellViewModel.swift
//  PodcastSwift
//
//  Created by hakkı can şengönül on 27.04.2023.
//

import Foundation
struct EpisodeCellViewModel {
    let episode: Episode!
    init(episode: Episode!) {
        self.episode = episode
    }
    var profileImageUrl: URL?{
        return URL(string: episode.imageUrl)
    }
    var title: String?{
        return episode.title
    }
    var description: String?{
        return episode.description
    }
    var pubDate: String?{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyy"
        return dateFormatter.string(from: episode.pubDate)
    }
}

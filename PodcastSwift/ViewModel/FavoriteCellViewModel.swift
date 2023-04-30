//
//  FavoriteCellViewModel.swift
//  PodcastSwift
//
//  Created by hakkı can şengönül on 1.05.2023.
//

import Foundation
struct FavoriteCellViewModel {
    var podcastCoreData: PodcastCoreData!
    init(podcastCoreData: PodcastCoreData!) {
        self.podcastCoreData = podcastCoreData
    }
    var imageUrlPodcast: URL?{
        return URL(string: podcastCoreData.artworkUrl600!)
    }
    var podcastNameLabel: String?{
        return podcastCoreData.trackName
    }
    var podcastArtistName: String?{
        return podcastCoreData.artistName
    }
}

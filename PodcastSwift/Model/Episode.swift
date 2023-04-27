//
//  Episode.swift
//  PodcastSwift
//
//  Created by hakkı can şengönül on 27.04.2023.
//

import Foundation
import FeedKit
struct Episode{
    let title: String
    let pubDate: Date
    let description: String
    let imageUrl: String
    init(value: RSSFeedItem) {
        self.title = value.title ?? ""
        self.pubDate = value.pubDate ?? Date()
        self.description = value.description ?? ""
        self.imageUrl = value.iTunes?.iTunesImage?.attributes?.href ?? "https://cdn.pixabay.com/photo/2018/09/23/00/09/podcast-3696504_1280.jpg"
    }
}

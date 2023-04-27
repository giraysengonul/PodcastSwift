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
    
    init(value: RSSFeedItem) {
        self.title = value.title ?? ""
        self.pubDate = value.pubDate ?? Date()
        self.description = value.description ?? ""
    }
}

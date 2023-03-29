//
//  Search.swift
//  PodcastSwift
//
//  Created by hakkı can şengönül on 29.03.2023.
//

import Foundation
struct Search: Decodable {
    let resultCount: Int
    let results: [Podcast]
}
struct Podcast: Decodable {
    var trackName: String?
    var artistName: String
    var trackCount: Int?
    var artworkUrl600: String?
    var feedUrl: String?
}

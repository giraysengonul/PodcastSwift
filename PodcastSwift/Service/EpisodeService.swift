//
//  EpisodeService.swift
//  PodcastSwift
//
//  Created by hakkı can şengönül on 27.04.2023.
//

import Foundation
import FeedKit
struct EpisodeService {
    static func fetchData(urlString: String, completion: @escaping([Episode]) -> Void){
        var episodeResult: [Episode] = []
        let feedKit = FeedParser(URL: URL(string: urlString)!)
        feedKit.parseAsync { result in
            switch result{
            case .success(let feed):
                switch feed{
                    
                case .atom(_):
                    break
                case .rss(let feedResult):
                    feedResult.items?.forEach({ value in
                        let episodeCell = Episode(value: value)
                        episodeResult.append(episodeCell)
                        completion(episodeResult)
                    })
                case .json(_):
                    break
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

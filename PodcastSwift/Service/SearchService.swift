//
//  SearchService.swift
//  PodcastSwift
//
//  Created by hakkı can şengönül on 29.03.2023.
//

import Foundation
import Alamofire
class SearchService {
    static func fetchData(searchText: String){
        let mainUrl = "https://itunes.apple.com/search"
        let parameters = ["media": "podcast", "term": searchText]
        AF.request(mainUrl,parameters: parameters).responseData { response in
            if let error = response.error{
                print(error.localizedDescription)
                return
            }
            guard let data = response.data else{ return }
            do{
                let searchResult = try JSONDecoder().decode(Search.self, from: data)
                print(searchResult.results)
            }catch{
                
            }
        }
    }
}

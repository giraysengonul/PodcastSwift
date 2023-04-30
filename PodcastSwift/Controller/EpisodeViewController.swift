//
//  EpisodeViewController.swift
//  PodcastSwift
//
//  Created by hakkı can şengönül on 1.04.2023.
//

import UIKit
private let reuseIdentifier = "EpisodeCell"
private let appDelegate = UIApplication.shared.delegate as! AppDelegate
class EpisodeViewController: UITableViewController {
     // MARK: - Properties
    private let context = appDelegate.persistentContainer.viewContext
    private var podcast: Podcast
    private var episodeResult: [Episode] = []{
        didSet{
            self.tableView.reloadData()
        }
    }
    private var isFavorite = false{
        didSet{
            setupNavBarItem()
        }
    }
    private var resultCoreDataItems: [PodcastCoreData] = []{
        didSet{
            let isValue = resultCoreDataItems.contains(where: {$0.feedUrl == self.podcast.feedUrl})
            if isValue{
                isFavorite = true
            }else{
                isFavorite = false
            }
        }
    }
     // MARK: - Lifecycle
    init(podcast: Podcast) {
        self.podcast = podcast
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        fetchData()
    }
}
 // MARK: - Service
extension EpisodeViewController{
    fileprivate func fetchData(){
        EpisodeService.fetchData(urlString: self.podcast.feedUrl!) { result in
            DispatchQueue.main.async {
                self.episodeResult = result
            }
        }
    }
}
 // MARK: - Selectors
extension EpisodeViewController{
    @objc private func handleFavoriButton(){
        if isFavorite{
            deleteCoreData()
        }else{
            addCoreData()
        }
    }
}
 // MARK: - Helpers
extension EpisodeViewController{
    private func deleteCoreData(){
        let value = resultCoreDataItems.filter({$0.feedUrl == self.podcast.feedUrl})
        context.delete(value.first!)
        self.isFavorite = false
    }
    private func addCoreData(){
        let model = PodcastCoreData(context: context)
        model.feedUrl = self.podcast.feedUrl
        model.artworkUrl600 = self.podcast.artworkUrl600
        model.artistName = self.podcast.artistName
        model.trackName = self.podcast.trackName
        appDelegate.saveContext()
        isFavorite = true
    }
    private func fetchCoreData(){
        let fetchRequest = PodcastCoreData.fetchRequest()
        do{
            let result = try context.fetch(fetchRequest)
            self.resultCoreDataItems = result
        }catch{
            
        }
        
    }
    private func setupNavBarItem(){
        if isFavorite{
            let navRightItem = UIBarButtonItem(image: UIImage(systemName: "heart.fill")?.withTintColor(.systemPink, renderingMode: .alwaysOriginal), style: .done, target: self, action: #selector(handleFavoriButton))
            self.navigationItem.rightBarButtonItem = navRightItem
        }else{
            let navRightItem = UIBarButtonItem(image: UIImage(systemName: "heart")?.withTintColor(.systemPink, renderingMode: .alwaysOriginal), style: .done, target: self, action: #selector(handleFavoriButton))
            self.navigationItem.rightBarButtonItem = navRightItem
        }
    }
    private func setup(){
        self.navigationItem.title = podcast.trackName
        tableView.register(EpisodeCell.self, forCellReuseIdentifier: reuseIdentifier)
        setupNavBarItem()
        fetchCoreData()
    }
}
 // MARK: - UITableViewDataSource
extension EpisodeViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodeResult.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! EpisodeCell
        cell.episode = self.episodeResult[indexPath.item]
        return cell
    }
}
// MARK: - UITableViewDelegate
extension EpisodeViewController{
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let episode = self.episodeResult[indexPath.item]
        let controller = PlayerViewController(episode: episode)
        self.present(controller, animated: true)
    }
}

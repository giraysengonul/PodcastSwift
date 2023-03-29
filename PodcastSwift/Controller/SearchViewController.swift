//
//  SearchViewController.swift
//  PodcastSwift
//
//  Created by hakkı can şengönül on 27.03.2023.
//

import UIKit
import Alamofire
private let reuseIdentifier = "SearchCell"
class SearchViewController: UITableViewController {
     // MARK: - Properties
     // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}
 // MARK: - Helpers
extension SearchViewController{
    private func style(){
        tableView.register(SearchCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 130
        let searchController = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
    private func layout(){
        
    }
}
 // MARK: - UItableViewDataSource
extension SearchViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SearchCell
        return cell
    }
}
 // MARK: - UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        SearchService.fetchData(searchText: searchText)
    }
}

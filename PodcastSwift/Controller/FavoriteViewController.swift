//
//  FavoriteViewController.swift
//  PodcastSwift
//
//  Created by hakkı can şengönül on 27.03.2023.
//

import UIKit
private let reuseIdentifier = "FavoriteCell"
class FavoriteViewController: UICollectionViewController {
     // MARK: - Properties
    private var resultCoreDataItems: [PodcastCoreData] = []{
        didSet{ collectionView.reloadData() }
    }
     // MARK: - Lifecycle
     init() {
         let flowLayout = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: flowLayout)
         setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let window = UIApplication.shared.connectedScenes.first as! UIWindowScene
        let mainTabController = window.keyWindow?.rootViewController as! MainTabBarController
        mainTabController.viewControllers?[0].tabBarItem.badgeValue = nil
        fetchData()
    }
}
 // MARK: - Helpers
extension FavoriteViewController{
    private func fetchData(){
        let fetchRequest = PodcastCoreData.fetchRequest()
        CoreDataController.fetchCoreData(fetchRequest: fetchRequest) { result in
            self.resultCoreDataItems = result
        }
    }
    private func setup(){
        view.backgroundColor = .white
        collectionView.register(FavoriteCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
    }
}
 // MARK: - UICollectionViewDataSource
extension FavoriteViewController{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.resultCoreDataItems.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FavoriteCell
        cell.podcastCoreData = self.resultCoreDataItems[indexPath.item]
        return cell
    }
}
 // MARK: - UICollectionViewDelegateFlowLayout
extension FavoriteViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 30) / 2
        return .init(width: width, height: width + 50)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 10, left: 10, bottom: 10, right: 10)
    }
}

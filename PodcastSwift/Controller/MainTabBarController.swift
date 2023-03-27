//
//  MainTabBarController.swift
//  PodcastSwift
//
//  Created by hakkı can şengönül on 27.03.2023.
//

import UIKit
class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}
 // MARK: - Helers
extension MainTabBarController{
    private func setup(){
        viewControllers = [
            createViewController(rootViewController: SearchViewController(), title: "Search", imagename: "magnifyingglass"),
            createViewController(rootViewController: FavoriteViewController(), title: "Favorites", imagename: "play.circle.fill"),
            createViewController(rootViewController: DownloadsViewController(), title: "Downloads", imagename: "square.stack.fill")
        ]
    }
    private func createViewController(rootViewController: UIViewController, title: String, imagename: String) -> UINavigationController{
        rootViewController.title = title
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        let controller = UINavigationController(rootViewController: rootViewController)
        controller.navigationBar.prefersLargeTitles = true
        controller.navigationBar.compactAppearance = appearance
        controller.navigationBar.standardAppearance = appearance
        controller.navigationBar.scrollEdgeAppearance = appearance
        controller.navigationBar.compactScrollEdgeAppearance = appearance
        controller.tabBarItem.title = title
        controller.tabBarItem.image = UIImage(systemName: imagename)
        return controller
    }
}

//
//  TabBarController.swift
//  NewsApp
//
//  Created by Vermut xxx on 19.08.2023.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.tintColor = .black
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        
        viewControllers = [
            setupNavigationController(rootViewController: GeneralViewController(viewModel: GeneralViewModel()), title: "General",
                                      Image: UIImage(systemName: "newspaper") ?? UIImage.add),
            setupNavigationController(rootViewController: BusinessViewController(),
                                      title: "Business",
                                      Image: UIImage(systemName: "briefcase") ?? UIImage.add),
            setupNavigationController(rootViewController: TechnologyViewController(),
                                      title: "Technology",
                                      Image: UIImage(systemName: "gyroscope") ?? UIImage.add)
            
        ]
    }
    
    private func setupNavigationController(rootViewController: UIViewController, title: String, Image: UIImage) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = Image
        rootViewController.navigationItem.title = title
        navigationController.navigationBar.prefersLargeTitles = true
        
        return navigationController
    }
    
    private func setupTabBar() {
        let appearence = UITabBarAppearance()
        appearence.configureWithOpaqueBackground()
        tabBar.scrollEdgeAppearance = appearence
        
        view.tintColor = .black
    }
}

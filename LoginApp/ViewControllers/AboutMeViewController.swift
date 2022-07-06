//
//  AboutMeViewController.swift
//  LoginApp
//
//  Created by Maxim Datsuk on 07.07.2022.
//

import UIKit

class AboutMeViewController: UIViewController {
    
    @IBOutlet var personalInfo: UILabel!
    @IBOutlet var jobInfo: UILabel!
    @IBOutlet var image: UIImageView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarVC = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarVC.viewControllers else { return }
        
        viewControllers.forEach { viewController in
            if let aboutMeVC = viewController as? AboutMeViewController {
                aboutMeVC.view.backgroundColor = .systemCyan
            } else if let hobbyVC = viewController as? HobbyViewController {
                hobbyVC.view.backgroundColor = .systemMint
            }
        }
    }
    
}

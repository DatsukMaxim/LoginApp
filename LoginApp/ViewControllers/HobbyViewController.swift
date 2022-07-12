//
//  HobbyViewController.swift
//  LoginApp
//
//  Created by Maxim Datsuk on 07.07.2022.
//

import UIKit

class HobbyViewController: UIViewController {

    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var photo: UIImageView!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.text = user.person.hobby.description
        photo.image = UIImage(named: "Friends")
    }
}

//
//  PetViewController.swift
//  LoginApp
//
//  Created by Maxim Datsuk on 07.07.2022.
//

import UIKit

class PetViewController: UIViewController {

    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var photo: UIImageView!
    
    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.text = user.person.pet.description
        nameLabel.text = user.person.pet.name
        ageLabel.text = user.person.pet.age
        photo.image = UIImage(named: "Pet")
    }
}

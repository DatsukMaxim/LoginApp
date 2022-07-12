//
//  AboutMeViewController.swift
//  LoginApp
//
//  Created by Maxim Datsuk on 07.07.2022.
//

import UIKit

class AboutMeViewController: UIViewController {
    
    @IBOutlet var photo: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var surnameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photo.image = UIImage(named: user.person.photo)
        title = user.person.fullName
        nameLabel.text = user.person.name
        surnameLabel.text = user.person.surname
        ageLabel.text = user.person.age
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let petVC = segue.destination as? PetViewController else { return }
        petVC.user = user
    }
}

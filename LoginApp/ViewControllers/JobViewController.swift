//
//  JobViewController.swift
//  LoginApp
//
//  Created by Maxim Datsuk on 12.07.2022.
//

import UIKit

class JobViewController: UIViewController {

    @IBOutlet var companyLabel: UILabel!
    @IBOutlet var departmentLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var experienceLabel: UILabel!
    @IBOutlet var logo: UIImageView!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        companyLabel.text = user.person.job.name
        departmentLabel.text = user.person.job.department
        titleLabel.text = user.person.job.title
        experienceLabel.text = user.person.job.experience
        logo.image = UIImage(named: user.person.job.logo)
    }

}

//
//  DetailViewController.swift
//  ContactsApp
//
//  Created by Özgün Can Beydili on 5.08.2023.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {
    
    let context = appDelegate.persistentContainer.viewContext

    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailFullnameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    var contact : Contact? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let contact = contact {
            detailImageView.image = UIImage(data: contact.photo!) ?? UIImage(named: "contact")
            detailFullnameLabel.text = contact.name
            phoneNumberLabel.text = contact.number
        }
    }

    @IBAction func editButtonTapped(_ sender: Any) {
        
    }
}

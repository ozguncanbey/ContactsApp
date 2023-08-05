//
//  NewContactViewController.swift
//  ContactsApp
//
//  Created by Özgün Can Beydili on 5.08.2023.
//

import UIKit

class NewContactViewController: UIViewController {

    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var contactImageView: UIImageView!
    @IBOutlet weak var phoneTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    @objc func closeKeyboard() {
        view.endEditing(true)
    }

    @IBAction func cancelButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func addPhotoButtonTapped(_ sender: Any) {
        
    }
}

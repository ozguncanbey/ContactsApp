//
//  NewContactViewController.swift
//  ContactsApp
//
//  Created by Özgün Can Beydili on 5.08.2023.
//

import UIKit
import CoreData

class NewContactViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    let context = appDelegate.persistentContainer.viewContext

    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var contactImageView: UIImageView!
    @IBOutlet weak var doneButton: UIBarButtonItem!
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
        clean()
        navigationController?.navigationBar.isHidden = false
    }
    
    @objc func closeKeyboard() {
        view.endEditing(true)
    }

    @IBAction func doneButtonTapped(_ sender: Any) {
        
        if nameTextField.text == "" {
            let alert = UIAlertController(title: "!!!", message: "You must fill the name field!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel))
            present(alert, animated: true)
        } else if phoneTextField.text == "" {
            let alert = UIAlertController(title: "!!!", message: "You must fill the phone field!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel))
            present(alert, animated: true)
        } else {
            let contact = Contact(context: context)
            
            if let name = nameTextField.text, let surname = surnameTextField.text, let phone = phoneTextField.text {
                
                contact.id = UUID()
                contact.name = "\(name) \(surname)"
                contact.number = phone
                let data = contactImageView.image?.jpegData(compressionQuality: 0.5)
                contact.photo = data
                
                appDelegate.saveContext()
                
                //NotificationCenter.default.post(name: Notification.Name(rawValue: "saved!"), object: nil)
                navigationController?.popViewController(animated: true)
            }
        }
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        clean()
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addPhotoButtonTapped(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        contactImageView.image = info[.editedImage] as? UIImage
        self.dismiss(animated: true)
    }
    
    func clean() {
        contactImageView.image = UIImage(named: "contact")
        nameTextField.text = ""
        surnameTextField.text = ""
        phoneTextField.text = ""
    }
    
}

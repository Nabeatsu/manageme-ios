//
//  ViewController.swift
//  manageme
//
//  Created by 田辺信之 on 2019/04/25.
//  Copyright © 2019 田辺信之. All rights reserved.
//

import UIKit
import Foundation
import FirebaseAuth

class ViewController: UIViewController, AuthDelegate {
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBAction private func didTapSignUpButton() {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let name = nameTextField.text ?? ""
        authClient.signUp(email: email, password: password, name: name)
    }
    var editingField: UITextField?
    let authClient = AuthClient()
    override func viewDidLoad() {
        super.viewDidLoad()
        authClient.delegate = self
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        editingField = textField
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let editingField = editingField else { return true }
        editingField.resignFirstResponder()
        return true
    }
}


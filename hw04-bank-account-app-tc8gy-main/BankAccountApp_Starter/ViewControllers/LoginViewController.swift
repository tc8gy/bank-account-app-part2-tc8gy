//
//  LoginViewController.swift
//  BankAccountApp
//
//  Created by Taylor-Ann Cribbs on 2/27/26.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Oulets
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    
    // MARK: - Info + Bonus
    
    // Username = "Alex"
    // Password = "1234"
    
    @objc func textFieldsChanged() {
        let username = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
    
        loginButton.isEnabled = !username.isEmpty && !password.isEmpty
    }
    
    // MARK: - Actions
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        if usernameTextField.text == "Alex" && passwordTextField.text == "1234" {
            errorLabel.text = ""
            
            performSegue(withIdentifier: "LoginToBank", sender: nil)
        } else {
            errorLabel.text = "Invalid Username or Password"
        }
    }
    
    
    // MARK: - Navigations
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let username = usernameTextField.text ?? ""
        // Set the bank screen username
        if let transfer = segue.destination as? ViewController {
            transfer.inputedName = username
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.borderWidth = 8
        view.layer.borderColor = UIColor.systemYellow.cgColor
    }
    
    @IBAction func unwindToLogin(unwindSegue: UIStoryboardSegue) {
        usernameTextField.text = ""
        passwordTextField.text = ""
        loginButton.isEnabled = true
    }
    
    // This handles resetting the UI when the user returns via the Back button
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        passwordTextField.text = ""
        errorLabel.text = ""
        loginButton.isEnabled = false
        
        usernameTextField.addTarget(self, action: #selector(textFieldsChanged), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldsChanged), for: .editingChanged)

    }
    
}

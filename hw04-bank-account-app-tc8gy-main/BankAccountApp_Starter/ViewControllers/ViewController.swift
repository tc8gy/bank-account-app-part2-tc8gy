//
//  ViewController.swift
//  BankAccountApp
//
//  Created by Al-Shakarji, Noor on 2/8/26.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet var balanceLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var userLabel: UILabel!
    @IBOutlet var amountTextField: UITextField!
    @IBOutlet var depositbutton: UIButton!
    @IBOutlet var checkBalanceButton: UIButton!
    @IBOutlet var withdrawButton: UIButton!
    @IBOutlet weak var transferButton: UIButton!
    
    
    
    // MARK: - Model
        let account = BankAccount(startingBalance:150.00)
        let user = User(name: "Student")
    
        var inputedName: String?
    
    
    // MARK: - Helpers
        // Updates the balance label using the current account balance.
        // This should be called after any successful deposit or withdrawal.
    
        func updateBalanceLabel() {
            // TODO: Use account.checkBalance() to update balanceLabel.text
            balanceLabel.text = String(format: "Balance: $%.2f", account.checkBalance())
        }
    
    
    // Reads and validates the amount entered by the user.
        // Returns nil if the input is invalid.
        func getEnteredAmount() -> Double? {
        // TODO:
            // 1. Read text from amountTextField
            let stringAmountEntered = amountTextField.text ?? ""
            
            // 2. Convert it to a Double & Ensure the amount is greater than 0
            if let amountEntered = Double(stringAmountEntered), amountEntered > 0 {
                    return amountEntered
                } else {
            // 4. If invalid, call showStatus("Enter a valid amount")
                    showStatus("Enter a valid amount")
                    return nil
                }
        }
    
    // Displays a message in the status label.
        func showStatus(_ message: String) {
                statusLabel.text = "Status: \(message)"
            }
        
    
    
    // MARK: - Actions
    
    @IBAction func checkBalanceTapped(_ sender: Any) {
    
    // 1. Call updateBalanceLabel()
        updateBalanceLabel()
    // 2. Call showStatus("Balance updated")
        showStatus("Balance Updated")
    }
    
    @IBAction func depositTapped(_ sender: Any) {
        // TODO:
    // 1. Get the entered amount using getEnteredAmount()
        if let amount = getEnteredAmount(){
            // 2. Call account.deposit(_:)
            account.deposit(amount)
            // 3. Call updateBalanceLabel()
            updateBalanceLabel()
            // 4. Show a status message for deposit
            showStatus(String(format:"Deposited $%.2f",amount))
            // 5. Clear the text field
            amountTextField.text = ""
        }
    }
    
    @IBAction func withdrawTapped(_ sender: Any) {
        // TODO:
        // 1. Get the entered amount using getEnteredAmount()
        if let amount = getEnteredAmount() {
            
            // 2. Call account.withdraw(_:)
            let verified = account.withdraw(amount)
            
            // 3. If successful:Update the balance
            if verified {updateBalanceLabel()
                
                // Show success status
                showStatus(String(format:"Withdrew $%.2f", amount))
                
            // 4. If not successful: Show "Insufficient funds"
            } else {
                showStatus("Insufficient Funds")
            }
            // 5. Clear the text field
            amountTextField.text = ""
            
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "BankToTransfer" {
            let destination = segue.destination as! TransferViewController
            destination.account = account
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateBalanceLabel()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initial UI setup
        updateBalanceLabel()
        statusLabel.text = "Status: Ready"
        userLabel.text = "Welcome, \(inputedName ?? "Student")"
        
        
        
        // Do any additional setup after loading the view.
        // Visual styling (do not modify)
           view.layer.borderWidth = 8
           view.layer.borderColor = UIColor.systemYellow.cgColor
        
    }


}


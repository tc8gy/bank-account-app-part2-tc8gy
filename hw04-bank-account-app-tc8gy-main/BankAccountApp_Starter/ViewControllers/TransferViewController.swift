//
//  TransferViewController.swift
//  BankAccountApp
//
//  Created by Taylor-Ann Cribbs on 2/27/26.
//

import UIKit

class TransferViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var targetAccountNumberTextField: UITextField!
    @IBOutlet weak var receiverNameTextField: UITextField!
    @IBOutlet weak var transferButton: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Visual styling (do not modify)
        view.layer.borderWidth = 8
        view.layer.borderColor = UIColor.systemYellow.cgColor
        
        // Do any additional setup after loading the view.
    }
    // MARK: - Properties
    
    var account: BankAccount?
    
    // MARK: - Methods
    
    // Validates Amount > 0
    
    func checkAmount() -> Double? {
        let stringAmountEntered = amountTextField.text ?? ""
        if let amountEntered = Double(stringAmountEntered), amountEntered > 0 {
            return amountEntered
        } else {
            statusLabel.text = "Enter Valid Amount"
            return nil
        }
    }
    
    //Receiver name cannot be empty
    
    func checkReceiverName() -> Bool {
        
        if let receiverName = receiverNameTextField.text, !receiverName.isEmpty{
            return true
        } else {
            statusLabel.text = "Enter Valid Receiver Name"
            return false
        }
    }
    
    //Account number must be 6 digits
    
    func checkAccountNumber() -> Bool {
        if let accountNumberText = targetAccountNumberTextField.text, accountNumberText.count == 6 {
            return true
        } else {
            statusLabel.text = "Enter Valid Account Number"
            return false
        }
    }
        
        
    // MARK: - Actions
        
        
        @IBAction func transferButtonTapped(_ sender: Any) {
            // Input validation
            guard let amount = checkAmount(), checkReceiverName(), checkAccountNumber() else {
                return
                }
            // Call account.withdraw(amount)
            if let currentAccount = account {
                let success = currentAccount.withdraw(amount)
                
                // If successful → Show message in status label: Transfer successful
                if success {
                    statusLabel.text = "Transfer successful"
                } else {
                // If insufficient funds → Show message in status label: Insufficient funds
                    statusLabel.text = "Insufficient funds"
                }
            }
        }
        
        
        // MARK: - Navigation
        
        /*
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */

}

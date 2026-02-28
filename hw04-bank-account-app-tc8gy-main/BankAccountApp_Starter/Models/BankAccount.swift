//
//  BankAccount.swift
//  BankAccountApp
//

import Foundation

class BankAccount {
    
    var balance: Double = 0
    
    init(startingBalance: Double) {
        self.balance = startingBalance
    }
    
    func checkBalance() -> Double {
        // TODO: Return the current balance
        return self.balance
    }
    
    func deposit(_ amount: Double) {
        // TODO: Add the given amount to the balance
        return self.balance += amount
    }
    
    func withdraw(_ amount: Double) -> Bool {
        // TODO:
        // - If the amount is less than or equal to the balance,
        if amount <= self.balance {
            //   subtract it and return true
            self.balance -= amount
            return true
        } else {
            // - Otherwise, return false
            return false
        }
    }
}

# Overview

In this homework, you will work with a **starter iOS project** provided through **GitHub Classroom**.
The project represents a simple **Bank Account system** that supports three core operations:

- Check account balance

- Deposit money

- Withdraw money

Your task is to **complete and verify the system logic and UI behavior** by connecting user input, model logic, and UI updates.

This assignment focuses on understanding **how a UIKit app works as a system**, not on adding new features.


**Important:** This homework currently has no deadline. A due date will be announced later on Canvas after we cover the required topics in class.

## Application Behavior Demo (Expected Output)

A **demo of the completed application** has been provided on Canvas.

By completing this assignment, **your application is expected to run and behave the same way as the demo**, including:

- Correct behavior for deposit, withdraw, and check balance

- Proper input validation

- Accurate balance updates

- Clear and correct status messages

If your app does not behave like the demo, it will be considered **incomplete**.

Demo link: On Canvas


## Getting Started

1. Accept the **GitHub Classroom invitation** linked in Canvas.

2. Clone your **private repository** to your computer (or MacInCloud).

3. Open the project in **Xcode**.

4. Run the app on the iOS Simulator to confirm it builds successfully.

The starter code is **intentionally incomplete**. You are expected to finish the required logic.



## Starter Code Structure

The starter project contains the following files:

- `ViewController.swift`
Handles user interaction, button actions, and UI updates.
Some logic is missing and must be completed by you.

- `BankAccount.swift` Contains the banking logic:
    - Store the account balance

    - Deposit money

    - Withdraw money

    - Check balance
You must **use the provided methods** to perform these operations.

- `User.swift` stores basic user information used for display.

## File Organization (Important)

The starter project is organized using the **Model–View–Controller** (MVC) pattern.

- **Model folder**: `BankAccount.swift`, `User.swift`

- **View Controller folder**: `ViewController.swift`

This structure is intentional and will be used again when we extend this app next week.
For this homework, **do not move files between folders**.

## Required Tasks

### Task 1: Deposit Operation

Complete the **Deposit** button logic so that it:

- Reads the amount from the text field

- Validates that the input is a positive number

- Calls the appropriate method in **BankAccount**

- Updates the balance label

- Displays a correct status message



### Task 2: Withdraw Operation

Complete the **Withdraw** button logic so that it:

- Reads the amount from the text field

- Validates the input

- Prevents withdrawing more than the available balance

- Updates the balance only when the withdrawal is successful

- Displays the correct status message for both success and failure




### Task 3: Check Balance Operation

Complete the **Check Balance** button logic so that it:

- Retrieves the current balance from the `BankAccount` model

- Updates the balance label

- Displays a status message indicating the balance was checked


## Submission Instructions

1. Commit and push your completed work to your GitHub Classroom repository.

2. Make sure the app builds and runs on the iOS Simulator.

3. Only commits pushed before the deadline will be graded.
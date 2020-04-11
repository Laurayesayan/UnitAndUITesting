//
//  ViewController.swift
//  UnitAndUiTesting
//
//  Created by Лаура Есаян on 07.04.2020.
//  Copyright © 2020 LY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var enterButton: UIButton!
    
    var isLoginValid = false
    var isPasswordValid = false
    var isButtonAccesses = false {
        didSet {
            if isPasswordValid && isLoginValid {
                enterButton.isEnabled = true
            } else {
                enterButton.isEnabled = false
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enterButton.isEnabled = false
    }
    
    @IBAction func checkLogin(_ sender: Any) {
        if let login = loginTextField.text {
            if validateLogin(login) {
                messageLabel.text = "Correct email"
                isLoginValid = true
                isButtonAccesses = true
            } else {
                messageLabel.text = "Incorrect e-mail"
                isLoginValid = false
                isButtonAccesses = false
            }
        }
    }
    
    @IBAction func checkPassword(_ sender: Any) {
        if let password = passwordTextField.text {
            if validatePassword(password) {
                messageLabel.text = "Correct password"
                isPasswordValid = true
                isButtonAccesses = true
            } else {
                messageLabel.text = "Password should contains \n minimum 6 characters \n at least 1 Uppercase Alphabet, \n 1 lowercase alphabet \n and 1 number"
                isPasswordValid = false
                isButtonAccesses = false
            }
        }
    }
    @IBAction func enter(_ sender: Any) {
        if isLoginValid && isPasswordValid {
            let alert = UIAlertController(title: "Info", message: "Sucsses", preferredStyle: .alert)
            
            self.present(alert, animated: true) {
                alert.dismiss(animated: true) { [weak self] in
                    let congratsViewController = UIViewController()
                    congratsViewController.view.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
                    let label = UILabel()
                    label.frame = CGRect(x: 0, y: 0, width: 200, height: 34)
                    label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                    label.textAlignment = .center
                    label.center = CGPoint(x: congratsViewController.view.frame.width / 2, y: congratsViewController.view.frame.height / 2)
                    label.text = "Congratulations!"
                    congratsViewController.view.addSubview(label)
                    self!.present(congratsViewController, animated: true, completion: nil)
                    
                }
            }
        } else {
            let alert = UIAlertController(title: "Info", message: "Error", preferredStyle: .alert)
            
            self.present(alert, animated: true) {
                alert.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    func validateLogin(_ login: String) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}").evaluate(with: login)
    }
    
    func validatePassword(_ password: String) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{6,}$").evaluate(with: password)
    }
    
}

//
//  LoginClass.swift
//  tabtest
//
//  Created by Kevin Abram on 11/12/17.
//  Copyright © 2017 Kevin Abram. All rights reserved.
//

import UIKit
import Firebase

class LoginClass: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var EmailText: UITextField!
    @IBOutlet weak var PasswordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.EmailText.delegate = self
        self.PasswordText.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.view.endEditing(true)
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
            ScrollView.setContentOffset(CGPoint(x: 0, y: 50), animated: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        ScrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func LoginAction(_ sender: UIButton) {
        if EmailText.text == "" || PasswordText.text == ""
        {
            let fillin = UIAlertController(title: "Login Failed", message: "Please fill in all necessary information", preferredStyle: UIAlertControllerStyle.alert)
            fillin.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
            self.present(fillin, animated: true, completion: nil)
        }
        else
        {
        let alert = UIAlertController(title: "Invalid Email and/or Password", message: "Please input a valid Email and/or Password", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        let alert2 = UIAlertController(title: "Technical Error", message: "Technical Error Has Been Encountered, if problem persists, contact kevinabram1000@gmail.com", preferredStyle: UIAlertControllerStyle.alert)
        alert2.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
        let internetalert = UIAlertController(title: "Network Error", message: "We have trouble in connecting to the network, please check internet connection and try again", preferredStyle: UIAlertControllerStyle.alert)
        internetalert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
        guard let email = EmailText.text, let password = PasswordText.text
            else
        {
            return
        }
        Auth.auth().signIn(withEmail: email, password: password, completion: {(User, Error) in
            if let error = Error {
                if let errcode = AuthErrorCode(rawValue: error._code)
                {
                    switch errcode{
                    case .invalidEmail: self.present(alert, animated: true, completion: nil)
                    case .wrongPassword: self.present(alert, animated: true, completion: nil)
                    case .networkError: self.present(internetalert, animated: true, completion: nil)
                    default: self.present(alert2, animated: true, completion: nil)
                    }
                }
                return
            }
            Auth.auth().addStateDidChangeListener() { auth, user in
                if user != nil {
                } else {
                }
                let controller = self.storyboard?.instantiateViewController(withIdentifier: "homestart")
                self.present(controller!, animated: true, completion: nil)
            }
        })
    }
    }
    
    @IBAction func LoginAdmin(_ sender: UIButton) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "homestart")
        self.present(controller!, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  RegisterClass.swift
//  tabtest
//
//  Created by Kevin Abram on 11/12/17.
//  Copyright © 2017 Kevin Abram. All rights reserved.
//

import UIKit
import Firebase
import CoreGraphics

class RegisterClass: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var UserNameText: UITextField!
    @IBOutlet weak var FirstNameText: UITextField!
    @IBOutlet weak var LastNameText: UITextField!
    @IBOutlet weak var EmailText: UITextField!
    @IBOutlet weak var PasswordText: UITextField!
    
    var activeField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.EmailText.delegate = self
        self.PasswordText.delegate = self
        self.UserNameText.delegate = self
        self.FirstNameText.delegate = self
        self.LastNameText.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.view.endEditing(true)
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == EmailText || textField == PasswordText || textField == LastNameText
        {
        ScrollView.setContentOffset(CGPoint(x: 0, y: 200), animated: true)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        ScrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func PerformSegue(_ sender: UIButton) {
    if FirstNameText.text == "" || LastNameText.text == "" || EmailText.text == "" || PasswordText.text == "" || UserNameText.text == ""
    {
        let fillin = UIAlertController(title: "Registration Failed", message: "Please fill in all necessary information", preferredStyle: UIAlertControllerStyle.alert)
        fillin.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
        self.present(fillin, animated: true, completion: nil)
    }
    else
    {
        var refUsers: DatabaseReference
        refUsers = Database.database().reference().child("User");
    let alert = UIAlertController(title: "Invalid Email", message: "Please enter a valid email", preferredStyle: UIAlertControllerStyle.alert)
    alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
    let alert2 = UIAlertController(title: "Invalid Email", message: "Email has already been in use, please use another email address", preferredStyle: UIAlertControllerStyle.alert)
    alert2.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
    let alert3 = UIAlertController(title: "Technical Error", message: "Technical Error Has Been Encountered, if problem persists, contact kevinabram1000@gmail.com", preferredStyle: UIAlertControllerStyle.alert)
    alert3.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
    let alert4 = UIAlertController(title: "Registration Successfull", message: "Your Account Has Been Registered Successfully!", preferredStyle: UIAlertControllerStyle.alert)
    alert4.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
    let internetalert = UIAlertController(title: "Network Error", message: "We have trouble in connecting to the network, please check internet connection and try again", preferredStyle: UIAlertControllerStyle.alert)
    internetalert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
        
        guard let firstname = FirstNameText.text, let lastname = LastNameText.text, let email = EmailText.text, let password = PasswordText.text, let username = UserNameText.text
        else
        {
            return
        }
        Auth.auth().createUser(withEmail: email, password: password, completion: {(User,
            Error) in
            if let error = Error {
                if let errcode = AuthErrorCode(rawValue: error._code)
                {
                    switch errcode{
                    case .invalidEmail: self.present(alert, animated: true, completion: nil)
                    case .emailAlreadyInUse: self.present(alert2, animated: true, completion: nil)
                    case .networkError: self.present(internetalert, animated: true, completion: nil)
                    default: self.present(alert2, animated: true, completion: nil)
                    }
                }
                return
                }
            let key = refUsers.child((User?.uid)!).key
            let Users = ["Email": email,
                         "Password": password,
                         "FirstName": firstname,
                         "LastName": lastname,
                         "UserName": username
                        ]
            refUsers.child(key).setValue(Users)
            self.present(alert4, animated: true, completion: nil)
            self.performSegue(withIdentifier: "LoginSegue", sender: alert4)
            })
        }
        }
}
        //else
     //   {
          //  WarningText.text = "Please input the necessary information"
       // }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


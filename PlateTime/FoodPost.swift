//
//  FoodPost.swift
//  PlateTime
//
//  Created by Kevin Abram on 1/18/18.
//  Copyright © 2018 Kevin Abram. All rights reserved.
//

import UIKit

class FoodPost: UIViewController, UITextViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var ScrollView: UIScrollView!
    
    @IBOutlet weak var PostDescription: UITextView!
    
    @IBOutlet weak var PostText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        PostText.delegate = self
        PostDescription.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.view.endEditing(true)
        return true
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        ScrollView.setContentOffset(CGPoint(x: 0, y: 200), animated: true)
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        ScrollView.setContentOffset(CGPoint(x: 0, y: 200), animated: true)
    }
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
            textView.resignFirstResponder()
            return true
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

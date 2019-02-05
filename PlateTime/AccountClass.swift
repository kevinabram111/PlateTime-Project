//
//  AccountClass.swift
//  tabtest
//
//  Created by Kevin Abram on 11/13/17.
//  Copyright © 2017 Kevin Abram. All rights reserved.
//

import UIKit
import Firebase

class AccountClass: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var profilepicImage: UIImageView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var usernameText: UITextField!
    
    //let dietArray: [String] =  ["None", "Vegetarian","Gluten-Free", "Lactose-Intolerant", "Vegan", "Pescatarian"]
    var rowsave: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // DietPickerView.dataSource = self
       // DietPickerView.delegate = self
        profilepicImage.layer.cornerRadius = profilepicImage.frame.size.width/2
        profilepicImage.clipsToBounds = true
        var refStorage: StorageReference
        refStorage = Storage.storage().reference();
        var refUsers: DatabaseReference
        refUsers = Database.database().reference();
        let userID = Auth.auth().currentUser?.uid
        refUsers.child("User").child(userID!).observeSingleEvent(of: .value) { (snapshot) in
            let value = snapshot.value as? NSDictionary
            let usernameval = value?["UserName"] as? String ?? ""
            let emailval = value?["Email"] as? String ?? ""
            let firstnameval = value?["FirstName"] as? String ?? ""
            let lastnameval = value?["LastName"] as? String ?? ""
            //let dietidval = value?["DietID"] as? Int ?? 0
            //self.DietPickerView.selectRow(dietidval, inComponent: 0, animated: true)
            let fullname = firstnameval + " " + lastnameval
            self.nameText.text = fullname
            self.usernameText.text = usernameval
            self.emailText.text = emailval
            refUsers.child("User").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
                if snapshot.hasChild("ProfilePicImage"){
                    let filePath = "\(userID!)/\("profilepicImage")"
                    refStorage.child("ProfilePicture").child(filePath).getData(maxSize: 10*1024*1024, completion: { (imgdata, error) in
                        let theuserPhoto = UIImage(data: imgdata!)
                        self.profilepicImage.image = theuserPhoto
        })
        }
            })
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    //func numberOfComponents(in pickerView: UIPickerView) -> Int {
      //  return 1
    //}
    
    //func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
      //  return dietArray.count
    //}
    
    //func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
      //  rowsave = row
       // return dietArray[row]
   // }
    
    @IBAction func SwipeGesture(_ sender: UISwipeGestureRecognizer) {
        var refUsers: DatabaseReference
        refUsers = Database.database().reference();
        refUsers.child("User").child(Auth.auth().currentUser!.uid).updateChildValues(["DietID": rowsave])
            UIView.animate(withDuration: 0.1,
                           delay: 0.0,
                           options: .curveEaseInOut,
                           animations: {
            }
            )
            let transition = CATransition()
            transition.duration = 0.3
            transition.type = kCATransitionMoveIn
            transition.subtype = kCATransitionFromRight
            view.window!.layer.add(transition, forKey: kCATransition)
            let controller = storyboard?.instantiateViewController(withIdentifier: "homestart")
            present(controller!, animated: false, completion: nil)
    }
    
    @IBAction func changeProfilePic(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(picker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var refUsers: DatabaseReference
        refUsers = Database.database().reference();
        var refStorage: StorageReference
        refStorage = Storage.storage().reference();
        var selectedimagefrompicker: UIImage?
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            selectedimagefrompicker = editedImage
            }
            else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
                selectedimagefrompicker = originalImage
            }
        dismiss(animated: true, completion: nil)
        profilepicImage.image = selectedimagefrompicker
        var imgdata = NSData()
        imgdata = UIImageJPEGRepresentation(profilepicImage.image!, 0.8)! as NSData
        let thefilePath = "\(Auth.auth().currentUser!.uid)/\("profilepicImage")"
        let themetaData = StorageMetadata()
        themetaData.contentType = "image/jpg"
    refStorage.child("ProfilePicture").child(thefilePath).putData(imgdata as Data, metadata: themetaData){(metaData,error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }else{
                //store downloadURL
                let downloadURL = metaData!.downloadURL()!.absoluteString
                //store downloadURL at database
                refUsers.child("User").child(Auth.auth().currentUser!.uid).updateChildValues(["ProfilePicImage": downloadURL])
        }
        }
    }
    @IBAction func SignOut(_ sender: UIButton) {
    self.performSegue(withIdentifier: "SignOutSegue", sender: nil)
        try! Auth.auth().signOut()
    }
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

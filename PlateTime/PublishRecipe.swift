//
//  PublishRecipe.swift
//  PlateTime
//
//  Created by Kevin Abram on 02/06/18.
//  Copyright © 2018 Kevin Abram. All rights reserved.
//

import UIKit
import Firebase

class PublishRecipe: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var picker = UIImagePickerController()

    @IBOutlet weak var PostPictureImage: UIImageView!
    
    @IBOutlet weak var RecipeDescription: UITextView!
    
    @IBOutlet weak var RecipeName: UITextField!
    
    @IBOutlet weak var StepsToCook: UITextView!
    
    @IBOutlet weak var IngredientTable: UITableView!
    
    @IBOutlet weak var IngredientChosenTable: UITableView!
    
    @IBOutlet weak var StepsToCookVar: UITextView!
    
    var arrayingredient: [String] = ["Beef", "Potato", "Pork", "Rice", "Salmon", "Chicken", "Spinach", "Lettuce", "Cucumber", "Tomato", "Cheese", "Bread", "Lettuce",  "Egg" ]
    
        var arraychosen: [String] = []
    
    @IBOutlet weak var searchIngredient: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchIngredient.delegate = self
        picker.delegate = self
        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        if searchIngredient.text!.isEmpty
        {
            //If the search text field is empty, then the list of the food shown is by default
            arrayingredient = ["Beef", "Potato", "Pork", "Rice", "Salmon", "Chicken", "Spinach", "Lettuce", "Cucumber", "Tomato", "Cheese", "Bread", "Lettuce",  "Egg" ]
        }
        else
        {
            //Initialize the text field first, then we can actually search by the food containing that ingredient in the textbox
            arrayingredient = ["Beef", "Potato", "Pork", "Rice", "Salmon", "Chicken", "Spinach", "Lettuce", "Cucumber", "Tomato", "Cheese", "Bread", "Lettuce",  "Egg" ]
            //Prepare the filter process, in which it will filter by the text inputted
            arrayingredient = arrayingredient.filter{ $0.contains(searchIngredient.text!) }
        }
        //Reloads all stored data on the ingredient table
        IngredientTable.reloadData()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Resign fist responde is to hide the keyboard of the application, this initiates when the text field is deselected
        textField.resignFirstResponder()
        self.view.endEditing(true)
        return true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //Seach bar button clicked, when the search button is clicked, the keyboard will be deselected and will be hidden
        searchBar.resignFirstResponder()
    }
    
    func searcBarShouldReturn(_ searchBar: UISearchBar) -> Bool {
        searchBar.resignFirstResponder()
        self.view.endEditing(true)
        return true
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        //This initializes the number of rows in the table view, it counts the number of food currently there is in the data stored
        var tablecount: Int
        if tableView == self.IngredientTable
        {
            tablecount = arrayingredient.count
            return tablecount
        }
        else if tableView == self.IngredientChosenTable
        {
            tablecount = arraychosen.count
            return tablecount
        }
        else
        {
            return 0
        }
        
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        //Did select row is actually to initialize on the select row on the table view, on what will happen when the table is clicked
        foodinitialize()
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        //This is an if then else condition to initialize the ingredients that can be chosen
        if tableView == self.IngredientTable
        {
            let chosen = arrayingredient[indexPath.row]
            //If the ingredient that is going to be picked is already on the chosen ingredient, then do nothing
            if arraychosen.contains(chosen)
            {
                
            }
            else
            {
                arraychosen += [chosen]
                IngredientChosenTable.reloadData()
            }
        }
        if tableView == self.IngredientChosenTable
        {
            arraychosen.remove(at: indexPath.row)
            IngredientChosenTable.reloadData()
        }
        //If there is ingredients that is chosen, then start the filtering process on the collection view
        if arraychosen != []
        {
            var foodcount = 0
            var tempfood = [foods]()
            for _ in foodlibrary
            {
                let test = Set(foodlibrary[foodcount].ingredients).intersection(Set(arraychosen))
                if test != []
                {
                    tempfood.append(foodlibrary[foodcount])
                }
                else
                {
                    
                }
                foodcount = foodcount + 1
            }
            foodlibrary = tempfood
        }
        else
        {
            foodinitialize()
        }
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
    if tableView == self.IngredientTable
    {
    let cell = IngredientTable.dequeueReusableCell(withIdentifier: "ingredientcell", for: indexPath) as! SearchIngredientCell
    cell.IngredientName.text = arrayingredient[indexPath.row]
    return cell
    }
    else if tableView == self.IngredientChosenTable
    {
    let cell = IngredientChosenTable.dequeueReusableCell(withIdentifier: "ChooseIngredient", for: indexPath) as! SelectedIngredientCell
    cell.IngredientLabel.text = arraychosen[indexPath.row]
    return cell
    }
    else
    {
    let cell = IngredientTable.dequeueReusableCell(withIdentifier: "ingredientcell", for: indexPath) as! SearchIngredientCell
    cell.IngredientName.text = arrayingredient[indexPath.row]
    return cell
    }
    }
    
    @IBAction func PublishRecipe(_ sender: UIButton) {
        
        print("test test")
        var refUsers: DatabaseReference
        refUsers = Database.database().reference()
        let storage = Storage.storage().reference(forURL: "gs://platetime-5b467.appspot.com")
        
        
        
        //let Recipes = [
          //  "RecipeName": RecipeName.text,
            //"StepsToCook": StepsToCook.text
        
    let key = refUsers.childByAutoId().key
    //refUsers.child(key).setValue(Recipes)
     
       // let imageref = storage.child("Post").child((Auth.auth().currentUser?.uid)!).child("\(key).jpg")
        //let data = UIImageJPEGRepresentation(self.PostPictureImage.image!, 0.6)
        //let uploadTask = imageref.putData(data!, metadata: nil, completion: nil)
            print("Urlworks")
            //refUsers.child("Post").setValue(thefeed)
        let imgdata = NSData()
         let thefilePath = "\(Auth.auth().currentUser!.uid)/\("publishimage")"
         let themetaData = StorageMetadata()
         themetaData.contentType = "image/jpg"
         storage.child("Post").child((Auth.auth().currentUser?.uid)!).child(key).putData(imgdata as Data, metadata: themetaData){(metaData,error) in
         if let error = error {
         print(error.localizedDescription)
         return
         }else{
         //store downloadURL
         let downloadURL = metaData!.downloadURL()!.absoluteString
         //store downloadURL at database
        
            let thefeed = ["UserID" : Auth.auth().currentUser?.uid as! String,
                           "UrlPath" : downloadURL,
                           "Likes" : 0,
                           "PostID" : key as String,
                           "Ingredients": self.arraychosen,
                           "RecipeName": self.RecipeName.text,
                           "StepsToCook": self.StepsToCook.text,
                           "Description": self.RecipeDescription.text
                ] as [String : Any]
            refUsers.child("Post").child(Auth.auth().currentUser!.uid).child(key).setValue(thefeed)
        }
        }
    }
    
    
    @IBAction func SelectImage(_ sender: UIButton) {
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        
        self.present(picker, animated:  true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    if let image = info[UIImagePickerControllerEditedImage] as? UIImage
    {
        PostPictureImage.image = image
    }
        self.dismiss(animated: true, completion: nil)
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

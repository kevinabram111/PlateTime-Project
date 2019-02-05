//
//  CookNowClass.swift
//  PlateTime
//
//  Created by Kevin Abram on ear12/17/17.
//  Copyright © 2017 Kevin Abram. All rights reserved.
//

import UIKit

class CookNowClass: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UITextFieldDelegate {

    @IBOutlet weak var foodView: UICollectionView!
    
    @IBOutlet weak var IngredientTable: UITableView!
    
    @IBOutlet weak var IngredientChosenTable: UITableView!
    
    @IBOutlet weak var searchIngredient: UISearchBar!
    
    @IBOutlet weak var definitionLabel: UITextView!
    
    //var arrayname: [String] = ["Smoked Salmon", "Tenderloin Steak", "French Fries", "Fried Rice", "Mashed Potato", "Potato Wedges"]
    
    var arrayingredient: [String] = ["Beef", "Potato", "Pork", "Rice", "Salmon", "Chicken", "Spinach", "Lettuce", "Cucumber", "Tomato", "Cheese", "Bread", "Lettuce",  "Egg" ]
    
    var arraychosen: [String] = []
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        //This returns the number of food there is in the array
        return foodlibrary.count
        
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
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        //Dequeque reusable view  cell is to prepare the collection view, then we will prepare the text on the collection voew otems as well as the image
        let cell = foodView.dequeueReusableCell(withReuseIdentifier: "ident", for: indexPath) as! FoodCell
        cell.label1.text = foodlibrary[indexPath.row].name
        let image : UIImage = UIImage(named: foodlibrary[indexPath.row].name)!
        cell.image1.image = image
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //Reloads data every time this menu is opened
        // Sets the delegate configuration so that the search ingredient search box can be used
        foodView.reloadData()
        searchIngredient.delegate = self
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
            //Else add the ingredient that is picked into the list of ingredient that is chosen 
        else
        {
        arraychosen += [chosen]
        foodView.reloadData()
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
        foodView.reloadData()
    }
    else
        {
        foodinitialize()
        foodView.reloadData()
        }
//    foodlibrary = foodlibrary.filter{ $0.ingredients.contains(arraychosen) }
        }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
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
    @IBAction func SearchMoreButton(_ sender: UIButton) {
        foodlibrarycooksave = foodlibrary
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        
        
        /*
         var ispresent = false
         let chosen = ingredientlibrary[indexGet]
         var countget = 0
         print("cartcount : " + String(cart.count))
         //if cart.count == 0
         //{
         for _ in cart
         {
         print("test value:")
         print(cart[countget].ingredientname + " = " +  chosen.ingredientname)
         if cart[countget].ingredientname.contains(chosen.ingredientname)
         {
         cart[countget].qty = cart[countget].qty + 1
         ispresent = true
         }
         countget = countget + 1
         //}
         }
         if ispresent == false
         {
         cart.append(ingredientlibrary[indexGet])
         
         }
         print("startcount")
         var countcart = 0
         for _ in cart
         {
         print(cart[countcart].ingredientname)
         print(cart[countcart].qty)
         countcart = countcart + 1
         }
        */
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

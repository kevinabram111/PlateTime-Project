//
//  IngredientShopClass.swift
//  PlateTime
//
//  Created by Kevin Abram on 1/8/18.
//  Copyright © 2018 Kevin Abram. All rights reserved.
//

import UIKit

class IngredientShopClass: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate{

    @IBOutlet weak var ShopCollection: UICollectionView!
    
    @IBOutlet weak var searchIngredient: UISearchBar!
    
    @IBOutlet weak var ImagePicGet: UIImageView!
    
    @IBOutlet weak var FoodNameLabel: UILabel!
    
    @IBOutlet weak var FoodPrice: UILabel!
    
    @IBOutlet weak var FoodDescLabel: UILabel!
    
    var indexGet: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchIngredient.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return ingredientlibrary.count
    }
    
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = ShopCollection.dequeueReusableCell(withReuseIdentifier: "shopcell1", for: indexPath) as! ShopCell
        cell.label1.text = ingredientlibrary[indexPath.row].ingredientname
        let image : UIImage = UIImage(named: ingredientlibrary[indexPath.row].ingredientname)!
        cell.image1.image = image
            return cell
    }

    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        ImagePicGet.image = UIImage(named: ingredientlibrary[indexPath.row].ingredientname)!
        FoodNameLabel.text = ingredientlibrary[indexPath.row].ingredientname
        FoodPrice.text = String(ingredientlibrary[indexPath.row].cost)
        FoodDescLabel.text = ingredientlibrary[indexPath.row].ingredientdesc
        indexGet = indexPath.row
    }
    
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        if searchIngredient.text!.isEmpty
        {
            ingredientinitialize()
            ShopCollection.reloadData()
        }
        else
        {
            ingredientlibrary = ingredientlibrary.filter{$0.ingredientname.contains(searchIngredient.text!)}
            ShopCollection.reloadData()
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

    @IBAction func AddToCart(_ sender: UIButton)
    {
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
 
    }
    
}


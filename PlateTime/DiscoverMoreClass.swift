//
//  DiscoverMoreClass.swift
//  PlateTime
//
//  Created by Kevin Abram on 12/27/17.
//  Copyright © 2017 Kevin Abram. All rights reserved.
//

import UIKit

class DiscoverMoreClass: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate{
    
    @IBOutlet weak var discovermorecollection: UICollectionView!
    
    @IBOutlet weak var useingredientsoutlet: UISwitch!
    
    @IBOutlet weak var searchIngredient: UISearchBar!
    
    var changevariable = "onandempty"
    
    var modifiedarray = [foods]()
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        if changevariable == "onandempty"
        {
        return foodlibrarycooksave.count
        }
        else
        {
        return modifiedarray.count
        }
    }
    
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = discovermorecollection.dequeueReusableCell(withReuseIdentifier: "discovermorecell", for: indexPath) as! DiscoverMoreCell
        if changevariable == "onandempty"
        {
        cell.DiscoverLabel.text = foodlibrarycooksave[indexPath.row].name
        let image : UIImage = UIImage(named: foodlibrarycooksave[indexPath.row].name)!
        cell.image1.image = image
        return cell
        }
        else
        {
        cell.DiscoverLabel.text = modifiedarray[indexPath.row].name
        let image : UIImage = UIImage(named: modifiedarray[indexPath.row].name)!
        cell.image1.image = image
        return cell
        }
    }
    
     public func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        useingredientsoutlet.setOn(true, animated: false)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func UseIngredients(_ sender: UISwitch) {
        foodinitialize()
        if useingredientsoutlet.isOn
        {
            if searchIngredient.text!.isEmpty
                {
                changevariable = "onandempty"
                //will return cook save class
                discovermorecollection.reloadData()
                }
            else
                {
                changevariable = "onandnotempty"
                modifiedarray = foodlibrarycooksave.filter{$0.name.contains(searchIngredient.text!)}
                discovermorecollection.reloadData()
                }
        }
        else
        {
            if searchIngredient.text!.isEmpty
            {
                changevariable = "offandempty"
                //will return the normal food library
                modifiedarray = foodlibrary
                discovermorecollection.reloadData()
            }
            else
            {
                changevariable = "offandnotempty"
                //will return the modified class and modify code here
                modifiedarray = foodlibrary.filter{$0.name.contains(searchIngredient.text!)}
                discovermorecollection.reloadData()
            }
        }
    }
    
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        if searchIngredient.text!.isEmpty
        {
            if useingredientsoutlet.isOn
            {
                changevariable = "onandempty"
                //will return cook save class
                discovermorecollection.reloadData()
            }
            else
            {
                changevariable = "offandempty"
                //will return the normal food library
                modifiedarray = foodlibrary
                discovermorecollection.reloadData()
            }
        }
        else
        {
            if useingredientsoutlet.isOn
            {
                changevariable = "onandnotempty"
                //will return the modified class and modify code here
                modifiedarray = foodlibrarycooksave.filter{$0.name.contains(searchIngredient.text!)}
                discovermorecollection.reloadData()
            }
            else
            {
                changevariable = "offandnotempty"
                //will return the modified class and modify code here
                modifiedarray = foodlibrary.filter{$0.name.contains(searchIngredient.text!)}
                discovermorecollection.reloadData()
            }
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

}

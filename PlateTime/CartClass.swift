//
//  CartClass.swift
//  PlateTime
//
//  Created by Kevin Abram on 1/11/18.
//  Copyright © 2018 Kevin Abram. All rights reserved.
//

import UIKit

class CartClass: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var TotalPriceVar: UILabel!
    
    var totalpricevarcount = 0
    
    @IBOutlet weak var cartTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return cart.count
    }
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    @objc public func cancelbuttonclicked(sender: UIButton)
    {
    let btnsendtag:UIButton = sender
    print(btnsendtag.tag)
    cart.remove(at: btnsendtag.tag)
    TotalPriceVar.text = "0"
    totalpricevarcount = 0
    cartTableView.reloadData()
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell =  cartTableView.dequeueReusableCell(withIdentifier: "cartvalue1", for: indexPath) as! CartValues
        cell.CancelButton.tag = indexPath.row
        cell.CancelButton.addTarget(self, action: #selector(cancelbuttonclicked(sender:)), for: .touchUpInside)
        cell.ingredientname.text = cart[indexPath.row].ingredientname
        cell.quantity.text = String(cart[indexPath.row].qty)
        cell.totalcostingredient.text = String(cart[indexPath.row].qty * cart[indexPath.row].cost)
        let image : UIImage = UIImage(named: cart[indexPath.row].ingredientname)!
        cell.image1.image = image
        cartTableView.rowHeight = 82
        totalpricevarcount = totalpricevarcount + (cart[indexPath.row].qty * cart[indexPath.row].cost)
        print("get quantity: " + String(cart[indexPath.row].qty))
        print("get cost: " + String(cart[indexPath.row].cost))
        TotalPriceVar.text = String(totalpricevarcount)
        return cell
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

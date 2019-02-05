//
//  MembershipClass.swift
//  PlateTime
//
//  Created by Kevin Abram on 1/17/18.
//  Copyright © 2018 Kevin Abram. All rights reserved.
//

import UIKit

class MembershipClass: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var MemberTable: UITableView!
    
    let namearray = ["1 week subscription", "1 month subscription"," 6 months subscription"]
    
    let costarray = ["$1", "$3", "$15"]
    
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
            return namearray.count
        }
        
        // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
        // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
        public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        {
            let cell = MemberTable.dequeueReusableCell(withIdentifier: "membercell", for: indexPath) as! MembershipCell
            cell.Membershipname.text = namearray[indexPath.row]
            cell.Membershipcost.text = costarray[indexPath.row]
            MemberTable.rowHeight = 75
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

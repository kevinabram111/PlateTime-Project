//
//  TimerClass.swift
//  PlateTime
//
//  Created by Kevin Abram on 1/17/18.
//  Copyright © 2018 Kevin Abram. All rights reserved.
//

import UIKit

class TimerClass: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var TimerTable: UITableView!
    
    var noarray = ["1. ","2. ", "3. ", "4. ", "5. ", "6. ", "7. ", "8. "]
    var stepsarray = ["Get some potatoes.", "Wash, dry, and peel the potatoes of any dirt or grime.", "Fill a dry pan with vegetable oil about 1/3 of the way full.", "Using a sharp, clean knife, chop the potatoes with caution.", "Make sure the vegetable oil is hot before you put the potatoes in.", "Cook the potato slices in the oil until they are golden brown.", "Cool the cooked French fries.", "Finished."]
    
    var timearray = ["00:00", "00:30", "01:25", "02:00", "02:45", "03:20", "04:00", "05:00"]
    
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
        return stepsarray.count
    }
    
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = TimerTable.dequeueReusableCell(withIdentifier: "TimeCell", for: indexPath) as! TimerCell
        cell.NoLabel.text = noarray[indexPath.row]
        cell.StepName.text = stepsarray[indexPath.row]
        cell.TimeStart.text = timearray[indexPath.row]
        TimerTable.rowHeight = 80
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

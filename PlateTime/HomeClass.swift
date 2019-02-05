//
//  HomeClass.swift
//  tabtest
//
//  Created by Kevin Abram on 11/13/17.
//  Copyright © 2017 Kevin Abram. All rights reserved.
//

import UIKit

class HomeClass: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var PostTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
     return SystemConfigPost.arrayname.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = PostTable.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        cell.PName.text = SystemConfigPost.arrayname[indexPath.row]
        if SystemConfigPost.numberoflikes[indexPath.row] == 0
        {
        let getnumber = SystemConfigPost.numberoflikes[indexPath.row]
        let numbertostring = String(getnumber)
        cell.LikedBy.text = (numbertostring + "person")
        }
        else
        {
        let getnumber = SystemConfigPost.numberoflikes[indexPath.row]
        let numbertostring = String(getnumber)
        cell.LikedBy.text = (numbertostring + " persons")
        }
        let image : UIImage = UIImage(named: SystemConfigPost.theimage[indexPath.row])!
        cell.PostImage.image = image
        cell.PostDescription.text = SystemConfigPost.arraydesc[indexPath.row]
        PostTable.rowHeight = 575
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func GoLeft(_ sender: UISwipeGestureRecognizer) {
        UIView.animate(withDuration: 0.1,
                       delay: 0.0,
                       options: .curveEaseInOut,
                       animations: {
        }
        )
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionMoveIn
        transition.subtype = kCATransitionFromLeft
        view.window!.layer.add(transition, forKey: kCATransition)
        let controller = storyboard?.instantiateViewController(withIdentifier: "accountstart")
        present(controller!, animated: false, completion: nil)
    }
    
    @IBAction func GoRight(_ sender: UISwipeGestureRecognizer) {
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
        let controller = storyboard?.instantiateViewController(withIdentifier: "discoverstart")
        present(controller!, animated: false, completion: nil)
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

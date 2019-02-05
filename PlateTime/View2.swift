//
//  View2.swift
//  tabtest
//
//  Created by Kevin Abram on 11/11/17.
//  Copyright © 2017 Kevin Abram. All rights reserved.
//

import UIKit

class View2: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func GoLeftAction(_ sender: UISwipeGestureRecognizer) {
        UIView.animate(withDuration: 0.25,
                       delay: 0.0,
                       options: .curveEaseInOut,
                       animations: {
        }
        )
        let transition = CATransition()
        transition.duration = 1
        transition.type = kCATransitionFade
        transition.subtype = kCATransitionFromLeft
        view.window!.layer.add(transition, forKey: kCATransition)
        let controller = storyboard?.instantiateViewController(withIdentifier: "viewc")
        present(controller!, animated: false, completion: nil)
    }
    
    @IBAction func GoRightAction(_ sender: UISwipeGestureRecognizer) {
        UIView.animate(withDuration: 0.25,
                       delay: 0.0,
                       options: .curveEaseInOut,
                       animations: {
        }
        )
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = kCATransitionFade
        transition.subtype = kCATransitionFromRight
        view.window!.layer.add(transition, forKey: kCATransition)
        let controller = storyboard?.instantiateViewController(withIdentifier: "view3c")
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

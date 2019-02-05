//
//  ViewController.swift
//  tabtest
//
//  Created by Kevin Abram on 11/11/17.
//  Copyright © 2017 Kevin Abram. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        foodinitialize()
        ingredientinitialize()
    }

    @IBAction func SwipeGestureAction(_ sender: UISwipeGestureRecognizer) {
        UIView.animate(withDuration: 0.25,
                       delay: 0.0,
                       options: .curveEaseInOut,
                       animations: {
        }
        )
        let transition = CATransition()
        transition.duration = 1
        transition.type = kCATransitionFade
        transition.subtype = kCATransitionFromRight
        view.window!.layer.add(transition, forKey: kCATransition)
        let controller = storyboard?.instantiateViewController(withIdentifier: "view2c")
        present(controller!, animated: false, completion: nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


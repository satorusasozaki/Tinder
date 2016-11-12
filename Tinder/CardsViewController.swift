//
//  CardsViewController.swift
//  Tinder
//
//  Created by Satoru Sasozaki on 11/12/16.
//  Copyright © 2016 Satoru Sasozaki. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    var profileOriginalCenter: CGPoint!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func profilePanGesture(_ sender: UIPanGestureRecognizer) {
        if sender.state == UIGestureRecognizerState.began {
            profileOriginalCenter = sender.view?.center
        } else if sender.state == UIGestureRecognizerState.changed {
            let translation = sender.translation(in: self.view)
            sender.view?.center = CGPoint(x: profileOriginalCenter.x + translation.x, y: profileOriginalCenter.y)
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

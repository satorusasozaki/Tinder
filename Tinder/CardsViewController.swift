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
    @IBOutlet weak var ryanImageView: UIImageView!
    var ryanImageViewHeight: CGFloat!
    var ryanImageViewInitialCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ryanImageViewHeight = ryanImageView.frame.height
        ryanImageViewInitialCenter = ryanImageView.center

    }
    
    @IBAction func profilePanGesture(_ sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: self.view)

        // degree to radian: degree * pi/180
        // why I cannot just go with radians? why do I need to divide translation.x by radians?
        var rotation = translation.x / 10 * CGFloat(M_PI / 180)
        //var rotation = 30 * CGFloat(M_PI / 180)
        print("translation: \(translation)")
        
        if sender.location(in: self.view).y > (sender.view?.center.y)! {
            rotation = -rotation
        }
        
        if sender.state == UIGestureRecognizerState.began {
            
            profileOriginalCenter = sender.view?.center
            
        } else if sender.state == UIGestureRecognizerState.changed {
            
            sender.view?.center = CGPoint(x: profileOriginalCenter.x + translation.x, y: profileOriginalCenter.y)
            // As the view slide 1 point represented in translation, it rotates based on the radius corresponding to the translation
            // 1 translation = x radius, 2 translation = 2x radius
            sender.view?.transform = CGAffineTransform.init(rotationAngle: rotation)
            
        } else if sender.state == UIGestureRecognizerState.ended {
            if sender.velocity(in: view).x > 50 {
                UIView.animate(withDuration: 0.3, animations: {
                    sender.view?.center.x += self.view.frame.width
                })
                
            } else if sender.velocity(in: view).x < -50 {
                UIView.animate(withDuration: 0.3, animations: {
                    sender.view?.center.x -= self.view.frame.width
                })
                
            } else {
                UIView.animate(withDuration: 0.3, animations: {
                    sender.view?.center = self.ryanImageViewInitialCenter
                    sender.view?.transform = CGAffineTransform.identity
                })
                
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

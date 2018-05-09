//
//  CardsViewController.swift
//  Tinder
//
//  Created by Elijah Kumi on 5/6/18.
//  Copyright © 2018 Elijah Kumi. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    
    
    var divisor: CGFloat!
    var cardInitialCenter: CGPoint!
    
    @IBOutlet var pictureView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        divisor = (view.frame.width / 2) / 0.61
        cardInitialCenter = pictureView.center
    }

    @IBAction func didPan(_ sender: UIPanGestureRecognizer) {
        let imageView = sender.view as! UIImageView
        let translation = sender.translation(in: view)
        let location = sender.location(in: view)
        let xFromCenter = imageView.center.x - view.center.x
        
        imageView.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y)
        
        if location.y < cardInitialCenter.y {
            imageView.transform = CGAffineTransform(rotationAngle: xFromCenter / divisor)
        } else {
            imageView.transform = CGAffineTransform(rotationAngle: xFromCenter / -divisor)
        }
        
        if sender.state == .began {
            print("Started pan")
        } else if sender.state == .changed {
            
        } else if sender.state == .ended {
            if imageView.center.x < cardInitialCenter.x - 50 {
                //animate to the right
                UIView.animate(withDuration: 0.3, animations: {
                    imageView.center = CGPoint(x: imageView.center.x - 500, y: imageView.center.y)
                    imageView.alpha = 0
                })
            } else if imageView.center.x > cardInitialCenter.x + 50 {
                UIView.animate(withDuration: 0.3, animations: {
                    imageView.center = CGPoint(x: imageView.center.x + 500, y: imageView.center.y)
                    imageView.alpha = 0
                })
            } else {
                imageView.center = cardInitialCenter
                imageView.transform = CGAffineTransform.identity
            }
        }
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

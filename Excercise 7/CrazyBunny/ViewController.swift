//
//  ViewController.swift
//  CrazyBunny
//
//  Created by Spas Bilyarski on 8.01.18.
//  Copyright © 2018 spasbilyarski. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var bunnyImageView: UIImageView!
    @IBOutlet weak var grassImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bunnyImageView.center = view.center
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let animationOut = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        animationOut.duration = 0.7
        animationOut.fromValue = 1
        animationOut.toValue = 0
        
        let animationIn = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        animationIn.duration = 0.5
        animationIn.fromValue = 0
        animationIn.toValue = 1
        animationIn.beginTime = animationOut.beginTime + animationOut.duration
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [animationOut, animationIn]
        animationGroup.duration = animationOut.duration + animationIn.duration
        
        bunnyImageView.layer.add(animationGroup, forKey: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Helpers
    
    func randomColor() -> UIColor {
        let redValue = CGFloat(arc4random_uniform(255)) / 255.0;
        let greenValue = CGFloat(arc4random_uniform(255)) / 255.0;
        let blueValue = CGFloat(arc4random_uniform(255)) / 255.0;
        
        return UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
    }
    
    @IBAction func tapAction(_ sender: Any) {
//        let backgroundColorAnimation = CABasicAnimation(keyPath: "backgroundColor")
//        backgroundColorAnimation.duration = 0.3
//        backgroundColorAnimation.fromValue = bunnyImageView.backgroundColor
//        backgroundColorAnimation.toValue = randomColor()
//        backgroundColorAnimation.beginTime = CACurrentMediaTime()
//
//        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
//        backgroundColorAnimation.duration = 0.3
//        backgroundColorAnimation.fromValue = bunnyImageView.layer.opacity
//        backgroundColorAnimation.toValue = 1
//        backgroundColorAnimation.beginTime = CACurrentMediaTime() + backgroundColorAnimation.beginTime + backgroundColorAnimation.duration
//
//        let animationGroup = CAAnimationGroup()
//        animationGroup.animations = [backgroundColorAnimation, opacityAnimation]
//        animationGroup.duration = backgroundColorAnimation.duration + opacityAnimation.duration
//
//        bunnyImageView.layer.add(animationGroup, forKey: nil)
        
        UIView.animate(withDuration: 0.1, animations: {
            self.bunnyImageView.backgroundColor = self.randomColor()
            self.bunnyImageView.layer.opacity = 0
            self.grassImageView.frame.size.height += 20
            self.grassImageView.center.y -= 20
        }, completion: { (_) in
            UIView.animate(withDuration: 0.1, animations: {
                self.bunnyImageView.layer.opacity = 1
                self.grassImageView.frame.size.height -= 20
                self.grassImageView.center.y += 20
            })
        })
    }
    
}


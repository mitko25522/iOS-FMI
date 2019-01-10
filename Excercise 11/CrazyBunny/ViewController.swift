//
//  ViewController.swift
//  CrazyBunny
//
//  Created by Spas Bilyarski on 8.01.18.
//  Copyright © 2018 spasbilyarski. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var bunnyImageView: UIImageView!
    @IBOutlet weak var grassImageView: UIImageView!
    @IBOutlet var bunnyPinchGesture: UIPinchGestureRecognizer!
    @IBOutlet var bunnyRotationGesture: UIRotationGestureRecognizer!
    @IBOutlet var bunnyPanGesture: UIPanGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bunnyPinchGesture.delegate = self
        bunnyRotationGesture.delegate = self
        bunnyPanGesture.delegate = self
        
        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(doubleTapGestureAction(_:)))
        
        doubleTapGesture.numberOfTapsRequired = 2
        bunnyImageView.addGestureRecognizer(doubleTapGesture)
        bunnyImageView.center = view.center
        bunnyImageView.layer.zPosition = 0
        grassImageView.layer.zPosition = 1
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
    
    @objc func doubleTapGestureAction(_ sender: UITapGestureRecognizer) {
        self.bunnyImageView.backgroundColor = randomColor()
    }
    
    @IBAction func bunnyPinchGestureAction(_ sender: UIPinchGestureRecognizer) {
        bunnyImageView.transform = bunnyImageView.transform.scaledBy(x: sender.scale, y: sender.scale)
        sender.scale = 1
    }
    @IBAction func bunnyRotationGestureAction(_ sender: UIRotationGestureRecognizer) {
        bunnyImageView.transform = bunnyImageView.transform.rotated(by: sender.rotation)
        sender.rotation = 0
    }
    
    @IBAction func bunnyPanGestureAction(_ sender: UIPanGestureRecognizer) {
        
        let newPoint = CGPoint(x: bunnyImageView.center.x + sender.translation(in: bunnyImageView).x, y: bunnyImageView.center.y + sender.translation(in: bunnyImageView).y)
        bunnyImageView.center = newPoint
        sender.setTranslation(CGPoint(x: 0, y: 0), in: bunnyImageView)
    }
}

extension ViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

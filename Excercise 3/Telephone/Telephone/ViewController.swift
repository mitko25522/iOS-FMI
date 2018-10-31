//
//  ViewController.swift
//  Telephone
//
//  Created by Dimitar Stoyanov on 25.10.18.
//  Copyright © 2018 Dimitar Stoyanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var parentView: UIView!
    @IBOutlet var numButtons: [UIButton]!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var eraseButton: UIButton!
    @IBOutlet weak var labelView: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.parentView.alpha = 0
        self.parentView.frame.origin.y += 100
    
        callButton.backgroundColor = .myGreen
        callButton.layer.cornerRadius = callButton.frame.width / 2
        
        for button in numButtons {
            button.layer.cornerRadius = button.frame.width / 2
        }
        
        self.parentView.fadeIn()
    }
}

extension UIView {
    func fadeIn() -> Void {
        UIView.animate(withDuration: 0.5) {
            self.alpha = 1
            self.frame.origin.y -= 100
        }
    }
}

extension ViewController {
    @IBAction func buttonTap(_ sender: UIButton) {
        if let buttonTitle = sender.currentTitle {
            labelView.text = "\(labelView.text ?? "")\(buttonTitle)"
        }
        sender.animate()
        updateEraseButton()
    }
    
    @IBAction func erase(_ sender: UIButton) {
        if let labelText = labelView.text?.dropLast() {
            labelView.text = String(labelText)
        }
        updateEraseButton()
    }
    
    func updateEraseButton() {
        eraseButton.isHidden = labelView.text?.isEmpty ?? true
    }
    
    @IBAction func zeroLongPress(_ sender: Any) {
        if (sender as? UILongPressGestureRecognizer)?.state == .began {
         labelView.text = (labelView.text ?? "") + "+"
        }
    }
    
}

extension UIButton {
    func animate(){
        UIView.animate(withDuration: 0.1, animations: {
            self.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }) { (finished) in
            UIView.animate(withDuration: 0.1, animations: {
                self.transform = .identity
            })
        }
    }
}

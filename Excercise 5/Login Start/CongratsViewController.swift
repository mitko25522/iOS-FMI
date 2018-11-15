//
//  CongratsViewController.swift
//  Login Start
//
//  Created by Spas Bilyarski on 18.10.18.
//  Copyright © 2018 FMI Practice. All rights reserved.
//

import UIKit

final class CongratsViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    var username: String?
    var password: String?
    
    var locationModel: LocationModel?
    
    override func viewDidLoad() {
        usernameLabel.text = username ?? ""
        passwordLabel.text = password ?? ""
        locationModel = LocationModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    // Задача 6: При всяко отваряне на CongratsViewController трябва да направите нова инстанция на LocationModel.
    
    // Задача 7: Бутонът "затваряне" трябва да извиква метода dismiss(_:), който ще затвори екрана.
    
    // Задача 8: Бутонът "напред" трабва да създаде програматично инстанция на MapViewController от nib файла. Също така трябва да му подадете вече създаденият LocationModel.
    
    // Задача 9: Ако получите известие, че паметта намалява освободете структората LocationModel и я създайте наново, ако потребителят натисне бутонът "напред".
    
    
    
    @IBAction func closeTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        let mapViewController = MapViewController(nibName: "MapViewController", bundle: nil)
        mapViewController.locationModel = locationModel
        self.navigationController!.pushViewController(mapViewController, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        locationModel = nil
    }
}

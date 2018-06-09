//
//  TarifViewController.swift
//  GKH
//
//  Created by Максим Годовиков on 09/06/2018.
//  Copyright © 2018 mGodovikov. All rights reserved.
//

import UIKit

class TarifViewController: UIViewController {

    @IBOutlet weak var hotLabel: UITextField!
    @IBOutlet weak var coldLabel: UITextField!
    @IBOutlet weak var electricityLabel: UITextField!
    
    @IBAction func backTapped() {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }

    @IBAction func save() {
        if let cold = Double(coldLabel.text!), let hot = Double(hotLabel.text!), let electricity = Double(electricityLabel.text!){
            tarif.cold = cold
            tarif.hot = hot
            tarif.electricity = electricity
            presentingViewController?.dismiss(animated: true, completion: nil)
        } else {
            let alertController = UIAlertController(title: "Ошибка", message:
                "Проверьте введенные данные", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Ок", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    var tarif: Tarif!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hotLabel.text = "\(tarif.hot)"
        coldLabel.text = "\(tarif.cold)"
        electricityLabel.text = "\(tarif.electricity)"
    }
}

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
    
    @IBAction func goBack() {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }

    @IBAction func save() {
        if let cold = Double(coldLabel.text!), let hot = Double(hotLabel.text!), let electricity = Double(electricityLabel.text!){
            let newTarif = Tarif()
            newTarif.cold = cold
            newTarif.hot = hot
            newTarif.electricity = electricity
            update(newTarif)
            goBack()
        } else {
            let alertController = UIAlertController(title: "Ошибка", message:
                "Проверьте введенные данные", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Ок", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    var update: ((Tarif) -> Void)!

    
    var tarif: Tarif!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hotLabel.text = "\(tarif.hot)"
        coldLabel.text = "\(tarif.cold)"
        electricityLabel.text = "\(tarif.electricity)"
    }
}

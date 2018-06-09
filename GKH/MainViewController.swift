//
//  ViewController.swift
//  GKH
//
//  Created by Максим Годовиков on 09/06/2018.
//  Copyright © 2018 mGodovikov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private let tarif = Tarif()
    private let clients = NSMutableArray()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension MainViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "client"{
            let secondVC = segue.destination as! ClientViewController
            secondVC.addClient = {(newClient) -> Void in
                self.clients.add(newClient)
            }
            
        } else if segue.identifier == "tarif"{
            let secondVC = segue.destination as! TarifViewController
            secondVC.tarif = self.tarif
        }
    }
}

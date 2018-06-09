//
//  ClientViewController.swift
//  GKH
//
//  Created by Максим Годовиков on 09/06/2018.
//  Copyright © 2018 mGodovikov. All rights reserved.
//

import UIKit

class ClientViewController: UIViewController {
    @IBAction func backTapped() {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    var addClient: ((_ newClient: Client) -> Void)? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

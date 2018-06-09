//
//  Client.swift
//  GKH
//
//  Created by Максим Годовиков on 09/06/2018.
//  Copyright © 2018 mGodovikov. All rights reserved.
//

import UIKit

class Client: NSObject {
    let address: String
    let cold: Int
    let hot: Int
    let electricity: Int
    
    var photo1: UIImage?
    var photo2: UIImage?
    
    init(address: String, cold: Int, hot: Int, electricity: Int) {
        self.address = address
        self.cold = cold
        self.hot = hot
        self.electricity = electricity
    }
    
}

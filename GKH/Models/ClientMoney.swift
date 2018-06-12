//
//  ClientMoney.swift
//  GKH
//
//  Created by Максим Годовиков on 11/06/2018.
//  Copyright © 2018 mGodovikov. All rights reserved.
//

import UIKit

class ClientMoney: NSObject {
    let date: Date
    let address: String
    let cold: Double
    let hot: Double
    let electricity: Double
    let total: Double

    var photo1: UIImage?
    var photo2: UIImage?
    
    init(clientData: ClientData, tarif: Tarif) {
        self.date = clientData.date
        self.address = clientData.address
        self.cold = Double(clientData.cold) * tarif.cold
        self.hot = Double(clientData.hot) * tarif.hot
        self.electricity = Double(clientData.electricity) * tarif.electricity
        total = cold + hot + electricity
        photo1 = clientData.photo1
        photo2 = clientData.photo2
        super.init()
    }
}

//
//  ClientModel.swift
//  GKH
//
//  Created by Максим Годовиков on 09/06/2018.
//  Copyright © 2018 mGodovikov. All rights reserved.
//

import UIKit

class ClientModel: NSObject {
    private let addressField = FIeldTextInput(placeHolder: "Номер квартиры", value: "")
    private let coldField = FIeldTextInput(placeHolder: "Холодная вода, куб. м.", value: "")
    private let hotField = FIeldTextInput(placeHolder: "Горячая вода, куб. м.", value: "")
    private let electricityField = FIeldTextInput(placeHolder: "Электричество, кВт*ч", value: "")
    private let photoField = FieldImages(image1: nil, image2: nil)

    let fields = NSMutableArray()
    
    override init() {
        super.init()
        fields.add(addressField)
        fields.add(coldField)
        fields.add(hotField)
        fields.add(electricityField)
        fields.add(photoField)
        fields.add(FieldSaveButton())
    }
    
    
    func getClient() -> Client {
        let client = Client(address: addressField.value, cold: Int(coldField.value)!, hot: Int(hotField.value)!, electricity: Int(electricityField.value)!)
        client.photo1 = photoField.image1
        client.photo2 = photoField.image2
        return client
    }
}

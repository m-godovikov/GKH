//
//  FIeldTextInput.swift
//  GKH
//
//  Created by Максим Годовиков on 09/06/2018.
//  Copyright © 2018 mGodovikov. All rights reserved.
//

import UIKit

class FIeldTextInput: NSObject {
    let placeHolder: String
    var value : String
    
    init(placeHolder: String, value : String) {
        self.placeHolder = placeHolder
        self.value = value
        super.init()
    }
}

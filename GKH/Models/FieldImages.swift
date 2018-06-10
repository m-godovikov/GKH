//
//  FieldImages.swift
//  GKH
//
//  Created by Максим Годовиков on 09/06/2018.
//  Copyright © 2018 mGodovikov. All rights reserved.
//

import UIKit

class FieldImages: NSObject {
    var image1: UIImage?
    var image2: UIImage?
    
    var photoLoaded: ((UIImage) -> Void)? = nil
    
    init(image1: UIImage?, image2 : UIImage?) {
        self.image1 = image1
        self.image2 = image2
        super.init()
    }
}

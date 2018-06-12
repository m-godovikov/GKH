//
//  CellImages.swift
//  GKH
//
//  Created by Максим Годовиков on 09/06/2018.
//  Copyright © 2018 mGodovikov. All rights reserved.
//

import UIKit

class CellImages: UITableViewCell {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBAction func buttonTap(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            clickListener?(imageHolder1)
        case 2:
            clickListener?(imageHolder2)
        default: break
        }
    }
    
    var field: FieldImages!

    
    private let imageHolder1 = ImageHolder()
    private let imageHolder2 = ImageHolder()

    
    var clickListener: ((ImageHolder) -> Void)!
    
    private func setImage1(image: UIImage?){
        image1.image = image
    }
    
    private func setImage2(image: UIImage?){
        image2.image = image
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        image1.layer.cornerRadius = 10
        image2.layer.cornerRadius = 10
        image1.layer.borderWidth = 1
        image2.layer.borderWidth = 1
        
        imageHolder1.callback = {(image) in
            self.image1.image = image
            self.field.image1 = image
        }
        imageHolder2.callback = {(image) in
            self.image2.image = image
            self.field.image2 = image
        }
    }

    
}

class ImageHolder: NSObject {
    
    var callback: ((UIImage?) -> Void)? = nil
    var image: UIImage? = nil {
        didSet{
            callback?(image)
        }
    }
}


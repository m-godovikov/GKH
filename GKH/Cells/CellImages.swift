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
            clickListener?(image1)
        case 2:
            clickListener?(image2)
        default: break
        }
    }
    
    
    var clickListener: ((UIImageView) -> Void)!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        image1.layer.cornerRadius = 10
        image2.layer.cornerRadius = 10
        image1.layer.borderWidth = 1
        image2.layer.borderWidth = 1
        
    }

    
}


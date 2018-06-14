//
//  CellClient.swift
//  GKH
//
//  Created by Максим Годовиков on 10/06/2018.
//  Copyright © 2018 mGodovikov. All rights reserved.
//

import UIKit

class CellClient: UITableViewCell {

    @IBAction func onTapImage1(_ sender: Any) {
        imageTapListener?(imageView1)
    }
    @IBAction func onTapImage2(_ sender: Any) {
        imageTapListener?(imageView2)
    }
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var coldLabel: UILabel!
    @IBOutlet weak var hotLabel: UILabel!
    @IBOutlet weak var electricityLabel: UILabel!
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var totalLabel: UILabel!
    
    var imageTapListener: ((UIImageView) -> Void)? = nil
    
    func setClientMoney(clientMoney: ClientMoney){
        dateLabel.text = dateToString(date: clientMoney.date)
        addressLabel.text = "\(clientMoney.address)"
        coldLabel.text = "\(clientMoney.cold)"
        hotLabel.text = "\(clientMoney.hot)"
        electricityLabel.text = "\(clientMoney.electricity)"
        totalLabel.text = "\(clientMoney.total)"
        
        setImage(image: clientMoney.photo1, imageView: imageView1)
        setImage(image: clientMoney.photo2, imageView: imageView2)
    }
    
    private func setImage(image: UIImage?, imageView: UIImageView){
        imageView.image = image
        imageView.isHidden = image == nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        view.layer.cornerRadius = 10
    }
    
    private func dateToString(date: Date) -> String{
        let dateFormatter = DateFormatter()
        let date = Date()
        
        // US English Locale (en_US)
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.setLocalizedDateFormatFromTemplate("dMMMM") // set template after setting locale
        return dateFormatter.string(from: date) // December 31

    }

}

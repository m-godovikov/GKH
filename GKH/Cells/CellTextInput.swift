//
//  CellTextInputTableViewCell.swift
//  GKH
//
//  Created by Максим Годовиков on 09/06/2018.
//  Copyright © 2018 mGodovikov. All rights reserved.
//

import UIKit

class CellTextInput: UITableViewCell {
    
    @IBOutlet weak var placeHolderLabel: UILabel!
    @IBOutlet weak var valueTextField: UITextField!
    
    var fieldModel: FIeldTextInput!{
        didSet{
            placeHolderLabel.text = fieldModel.placeHolder
            valueTextField.text = fieldModel.value
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        valueTextField.addTarget(self, action: #selector(CellTextInput.valueHasChanged(_:)), for: UIControlEvents.editingChanged)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func valueHasChanged(_ textField: UITextField) {
        fieldModel.value = valueTextField.text ?? ""
    }
    
}

//
//  CellTextInputTableViewCell.swift
//  GKH
//
//  Created by Максим Годовиков on 09/06/2018.
//  Copyright © 2018 mGodovikov. All rights reserved.
//

import UIKit

class CellTextInput: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var placeHolderLabel: UILabel!
    @IBOutlet weak var valueTextField: UITextField!
    
    var fieldModel: FIeldTextInput!{
        didSet{
            placeHolderLabel.text = fieldModel.placeHolder
            valueTextField.text = fieldModel.value
        }
    }
    
    var onFocus: ((IndexPath?) -> Void)? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        valueTextField.addTarget(self, action: #selector(CellTextInput.valueHasChanged(_:)), for: UIControlEvents.editingChanged)
        valueTextField.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func valueHasChanged(_ textField: UITextField) {
        fieldModel.value = valueTextField.text ?? ""
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        onFocus?(indexPath)
    }
}

extension UITableViewCell {
    
    var tableView: UITableView? {
        return next(UITableView.self)
    }
    
    var indexPath: IndexPath? {
        return tableView?.indexPath(for: self)
    }
}
extension UIResponder {
    
    func next<T: UIResponder>(_ type: T.Type) -> T? {
        return next as? T ?? next?.next(type)
    }
}

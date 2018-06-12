//
//  ClientViewController.swift
//  GKH
//
//  Created by Максим Годовиков on 09/06/2018.
//  Copyright © 2018 mGodovikov. All rights reserved.
//

import UIKit

class ClientViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBAction func goBack() {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    private let NIB_TEXT = UINib(nibName: "CellTextInput", bundle: nil)
    private let IDENTIFIER_TEXT = "IDENTIFIER_TEXT"
    
    private let NIB_SAVE_BUTTON = UINib(nibName: "CellSaveButton", bundle: nil)
    private let IDENTIFIER_SAVE_BUTTON = "IDENTIFIER_SAVE_BUTTON"
    
    private let NIB_IMAGES = UINib(nibName: "CellImages", bundle: nil)
    private let IDENTIFIER_IMAGES = "IDENTIFIER_IMAGES"
    
    let imagePicker = UIImagePickerController()
    
    var focusedIndexPath: IndexPath? = nil

    
    var addClient: ((_ newClient: ClientData) -> Void)!
    private var photoImageHolder: ImageHolder? = nil
    
    private let model = ClientModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ClientViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ClientViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        
        imagePicker.delegate = self
        
        tableView.register(NIB_TEXT, forCellReuseIdentifier: IDENTIFIER_TEXT)
        tableView.register(NIB_IMAGES, forCellReuseIdentifier: IDENTIFIER_IMAGES)
        tableView.register(NIB_SAVE_BUTTON, forCellReuseIdentifier: IDENTIFIER_SAVE_BUTTON)
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 10
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ClientViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.fields.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let field = model.fields[indexPath.row]
        if let textField = field as? FIeldTextInput{
            let cell = tableView.dequeueReusableCell(withIdentifier: IDENTIFIER_TEXT, for: indexPath) as! CellTextInput
            cell.fieldModel = textField
            cell.onFocus = {(focusedIndexPath) in
                self.focusedIndexPath = focusedIndexPath
            }
            return cell
        } else if field is FieldSaveButton{
            let cell = tableView.dequeueReusableCell(withIdentifier: IDENTIFIER_SAVE_BUTTON, for: indexPath) as! CellSaveButton
            cell.clickListener = saveAndExit
            return cell
        } else if field is FieldImages{
            let cell = tableView.dequeueReusableCell(withIdentifier: IDENTIFIER_IMAGES, for: indexPath) as! CellImages
            cell.clickListener = pickImage
            cell.field = field as! FieldImages
            return cell
        }
        
        return UITableViewCell()
    }
}

extension ClientViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        view.endEditing(true)
    }
}

extension ClientViewController{
    func saveAndExit() {
        if let client = model.getClient(){
            addClient(client)
            goBack()
        }else {
            let alertController = UIAlertController(title: "Ошибка", message:
                "Проверьте введенные данные. Все показания должны быть целыми числами.", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Ок", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
}


extension ClientViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            photoImageHolder?.image = pickedImage
        }
        photoImageHolder = nil
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        photoImageHolder = nil
        dismiss(animated: true, completion: nil)
    }
    
    func pickImage(_ photoImageHolder: ImageHolder){
        self.photoImageHolder = photoImageHolder
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .camera
            present(imagePicker, animated: true, completion: nil)
        } else {
            let alertController = UIAlertController(title: "Упс", message:
                "Не могу найти камеру.", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Ок", style: UIAlertActionStyle.default,handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
    }
}

extension ClientViewController {
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            self.tableView.contentInset = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.height, 0.0)
            if let path = focusedIndexPath {
                self.tableView.scrollToRow(at: path, at: .middle, animated: true)
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        self.tableView.contentInset = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)
    }
    
}


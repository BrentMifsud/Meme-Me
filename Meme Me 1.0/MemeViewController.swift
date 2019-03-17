//
//  ViewController.swift
//  Meme Me 1.0
//
//  Created by Brent Mifsud on 2019-03-17.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import UIKit

class MemeViewController: UIViewController {

    //MARK:- IBOutlets
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var actionButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var galleryButton: UIBarButtonItem!
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    let textFieldDelegate = TextFieldDelegate()
    
    let textAttributes: [NSAttributedString.Key:Any] = [
        NSAttributedString.Key.strokeColor: UIColor.black,
        NSAttributedString.Key.foregroundColor: UIColor.white,
        NSAttributedString.Key.font: UIFont(name: "Impact", size: 40)!,
        NSAttributedString.Key.strokeWidth: -5
    ]
    
    //MARK:- View Controller Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initTextField(textField: topTextField, text: "TOP")
        initTextField(textField: bottomTextField, text: "BOTTOM")
        actionButton.isEnabled = false
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
    }
    
    //MARK:- IBActions
    @IBAction func actionButtonPressed(_ sender: Any) {
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
    }
    
    @IBAction func cameraButtonPressed(_ sender: Any) {
    }
    
    @IBAction func galleryButtonPressed(_ sender: Any) {
    }
    
    
    
    //MARK:- Helper Methods
    func initTextField(textField: UITextField, text: String){
        textField.delegate = textFieldDelegate
        textField.defaultTextAttributes = textAttributes
        textField.text = text
        textField.textAlignment = .center
    }


}


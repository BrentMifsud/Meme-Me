//
//  TextfieldDelegate.swift
//  Meme Me 1.0
//
//  Created by Brent Mifsud on 2019-03-17.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import Foundation
import UIKit

class TextfieldDelegate: NSObject, UITextFieldDelegate {
    
    let textAttributes: [NSAttributedString.Key:Any] = [
        NSAttributedString.Key.strokeColor: UIColor.black,
        NSAttributedString.Key.foregroundColor: UIColor.white,
        NSAttributedString.Key.font: UIFont(name: "Impact", size: 40)!,
        NSAttributedString.Key.strokeWidth: -2
    ]
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Begin Editing")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        textField.defaultTextAttributes = textAttributes
        
        var newText = textField.text! as NSString
        newText = newText.replacingCharacters(in: range, with: string) as NSString
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        print("End Editing")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Return Button Pressed")
        return true
    }
    
}

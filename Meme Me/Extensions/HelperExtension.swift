//
//  HelperExtension.swift
//  Meme Me
//
//  Created by Brent Mifsud on 2019-03-18.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import UIKit

extension MemeEditorView {
	func initTextField(textField: UITextField, text: String){
		textField.delegate = textFieldDelegate
		textField.defaultTextAttributes = textAttributes
		textField.text = text
		textField.textAlignment = .center
	}

	func setToolbarVisibility(isHidden: Bool){
		self.navigationController?.isNavigationBarHidden = isHidden
		self.toolbar.isHidden = isHidden
	}

	func saveMeme() {
		let meme = Meme(topText: topTextField.text ?? "", bottomText: bottomTextField.text ?? "", originalImage: imageView.image!, memedImage: generateMemedImage())
		print("Meme Saved: \(meme)")
	}

	func generateMemedImage() -> UIImage{
		// Hide toolbar and navbar
		setToolbarVisibility(isHidden: true)

		// Render view to an image
		UIGraphicsBeginImageContext(self.view.frame.size)
		view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
		let memedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
		UIGraphicsEndImageContext()

		// Show toolbar and navbar
		setToolbarVisibility(isHidden: false)

		return memedImage
	}
}

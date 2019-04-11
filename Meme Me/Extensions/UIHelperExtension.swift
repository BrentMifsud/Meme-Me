//
//  UIHelperFunctions.swift
//  Meme Me
//
//  Created by Brent Mifsud on 2019-04-06.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import UIKit

extension MemeEditorView {

	// Setup the text fields when Meme Editor Initially Loads
	func initTextField(textField: UITextField, text: String){
		textField.delegate = textFieldDelegate
		textField.defaultTextAttributes = textAttributes
		textField.text = text
		textField.textAlignment = .center
	}

	// Return the memeContentView to its original state
	func resetMemeContentView() {
		memeView.isHidden = true
		actionButton.isEnabled = false
		cancelButton.isEnabled = false
		cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
		imageView.image = nil
		topTextField.text = "TOP"
		bottomTextField.text = "BOTTOM"
		memeViewTop.constant = 0
		memeViewBottom.constant = 0
		memeViewLeft.constant = 0
		memeViewRight.constant = 0
	}

	func updateMemeView(_ imageRect: CGRect) {
		// Set the constriants of the memeContentView
		memeViewTop.constant = imageRect.origin.y
		memeViewBottom.constant = imageRect.origin.y
		memeViewLeft.constant = imageRect.origin.x
		memeViewRight.constant = imageRect.origin.x

		// Unhide the memeView and enable sharing and cancel buttons
		memeView.isHidden = false
		actionButton.isEnabled = true
		cancelButton.isEnabled = true
	}

	func getScaledImageRect(viewFrame: CGRect, image: UIImage) -> CGRect {
		// Calculate the CGRect for the scaled image.
		let viewWidth = viewFrame.size.width
		let viewHeight = viewFrame.size.height
		let imageWidth = image.size.width
		let imageHeight = image.size.height

		var scale = viewWidth / imageWidth
		if (viewHeight / imageHeight < scale) {
			scale = viewHeight / imageHeight
		}

		let size = CGSize(width: imageWidth * scale, height: imageHeight * scale)
		let origin = CGPoint(x: (viewWidth - size.width) / 2, y: (viewHeight - size.height) / 2)
		return CGRect(origin: origin, size: size)
	}
}

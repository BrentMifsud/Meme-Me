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
		let minSide = min(viewHeight, viewWidth)

		let scale: CGFloat

		if image.size.width == image.size.height {
			scale = minSide / image.size.width
		} else if image.size.width > image.size.height {
			scale = viewWidth / image.size.width
		} else {
			scale = viewHeight / image.size.height
		}

		let size = CGSize(width: image.size.width * scale, height: image.size.height * scale)
		let origin = CGPoint(x: (viewWidth - size.width) / 2, y: (viewHeight - size.height) / 2)
		return CGRect(origin: origin, size: size)
	}
}

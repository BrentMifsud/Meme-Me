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
		textField.isHidden = true
	}

	// Return the memeContentView to its original state
	func resetMemeContentsView() {
		imageView.image = nil
		topTextField.text = "TOP"
		bottomTextField.text = "BOTTOM"
		topTextField.isHidden = true
		bottomTextField.isHidden = true
		memeContentViewTopConstraint.constant = 0
		memeContentViewBottomConstraint.constant = 0
		memeContentViewLeftConstraint.constant = 0
		memeContentViewRightConstraint.constant = 0
		actionButton.isEnabled = false
		cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
		galleryButton.isEnabled = true
		cancelButton.isEnabled = false
	}

	// Sets the Height and Width Constraints of the top and bottom text
	func updateMemeContentView() {
		actionButton.isEnabled = true
		cancelButton.isEnabled = true
		cameraButton.isEnabled = false
		galleryButton.isEnabled = false
		topTextField.isHidden = false
		bottomTextField.isHidden = false
		memeContentViewTopConstraint.constant = getImageOrigin().y
		memeContentViewBottomConstraint.constant = getImageOrigin().y
		memeContentViewLeftConstraint.constant = getImageOrigin().x
		memeContentViewRightConstraint.constant = getImageOrigin().x
	}
}

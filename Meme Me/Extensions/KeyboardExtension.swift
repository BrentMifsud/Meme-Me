//
//  KeyboardExtension.swift
//  Meme Me
//
//  Created by Brent Mifsud on 2019-03-18.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//
import UIKit

extension MemeEditorView {
	func subscribeToKeyboardNotifications() {
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)

		self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboardOnTap)))
	}

	func unsubscribeFromKeyboardNotifications() {
		NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
		NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)

		self.view.removeGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboardOnTap)))
	}

	@objc func keyboardWillShow(_ notification: Notification) {
		if bottomTextField.isEditing {
			let tabBarHeight = self.tabBarController!.tabBar.frame.size.height

			view.frame.origin.y = 0 - (getKeyboardHeight(notification) - tabBarHeight)
		}
	}

	@objc func keyboardWillHide(_ notification: Notification) {
		if bottomTextField.isEditing {
			view.frame.origin.y = 0
		}
	}

	@objc func dismissKeyboardOnTap(){
		self.view.endEditing(true)
	}

	private func getKeyboardHeight(_ notification: Notification) -> CGFloat {
		let keyboardSize = notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue // of CGRect
		return keyboardSize.cgRectValue.height
	}
}

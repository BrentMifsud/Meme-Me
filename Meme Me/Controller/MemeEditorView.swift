//
//  ViewController.swift
//  Meme Me
//
//  Created by Brent Mifsud on 2019-03-17.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import UIKit

class MemeEditorView: UIViewController,	UIImagePickerControllerDelegate,	UINavigationControllerDelegate {

	// MARK:- IBOutlets
	// MARK: Main View Items
	@IBOutlet weak var navigationBar: UINavigationItem!
	@IBOutlet weak var cancelButton: UIBarButtonItem!
	@IBOutlet weak var toolBar: UIToolbar!
	@IBOutlet weak var actionButton: UIBarButtonItem!
	@IBOutlet weak var cameraButton: UIBarButtonItem!
	@IBOutlet weak var galleryButton: UIBarButtonItem!

	// MARK: Meme Editor Items
	@IBOutlet weak var memeEditorView: UIView!
	@IBOutlet weak var memeView: UIView!
	@IBOutlet weak var topTextField: UITextField!
	@IBOutlet weak var bottomTextField: UITextField!
	@IBOutlet weak var imageView: UIImageView!

	//Constraints
	@IBOutlet weak var memeViewTop: NSLayoutConstraint!
	@IBOutlet weak var memeViewBottom: NSLayoutConstraint!
	@IBOutlet weak var memeViewLeft: NSLayoutConstraint!
	@IBOutlet weak var memeViewRight: NSLayoutConstraint!


	let textFieldDelegate = TextFieldDelegate()

	let textAttributes: [NSAttributedString.Key:Any] = [
		NSAttributedString.Key.strokeColor: UIColor.black,
		NSAttributedString.Key.foregroundColor: UIColor.white,
		NSAttributedString.Key.font: UIFont(name: "Impact", size: 40)!,
		NSAttributedString.Key.strokeWidth: -5
	]


	// MARK:- View Controller Methods
	override func viewDidLoad() {
		super.viewDidLoad()
		initTextField(textField: topTextField, text: "TOP")
		initTextField(textField: bottomTextField, text: "BOTTOM")
		resetMemeContentView()
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		subscribeToKeyboardNotifications()
	}

	override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
		super.viewWillTransition(to: size, with: coordinator)

		guard let image = imageView.image else { return }

		coordinator.animate(alongsideTransition: { (_) in
			let w = self.memeEditorView.frame.width
			let h = self.memeEditorView.frame.height

			let newRect = CGRect(x: 0, y: 0, width: w, height: h)

			let newImageRect = self.getScaledImageRect(viewFrame: newRect, image: image)

			self.updateMemeView(newImageRect)
		}, completion: nil)
	}

	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		unsubscribeFromKeyboardNotifications()
	}

	// MARK:- IBActions
	@IBAction func actionButtonPressed(_ sender: Any) {
		// End text editing so that the text cursor does not show up in the meme image.
		view.endEditing(true)
		let memeImage = generateMemedImage()

		let activityVC = UIActivityViewController(activityItems: [memeImage], applicationActivities: nil)

		present(activityVC, animated: true, completion: nil)

		// support iPad popover activity view controller.
		if let popOver = activityVC.popoverPresentationController {
			popOver.sourceView = self.view
			popOver.barButtonItem = actionButton
		}

		activityVC.completionWithItemsHandler = { (activityType, completed, returnedItems, activityError) in
			if completed {
				self.saveMeme()
			}
		}
	}


	@IBAction func cancelButtonPressed(_ sender: Any) {
		resetMemeContentView()
	}


	@IBAction func chooseImage(_ sender: UIBarButtonItem) {
		let imagePicker = UIImagePickerController()
		imagePicker.delegate = self

		switch (sender.tag) {
		case 0:
			imagePicker.sourceType = .camera
		default:
			imagePicker.sourceType = .photoLibrary
		}

		imagePicker.allowsEditing = true
		present(imagePicker, animated: true, completion: nil)
	}


	// MARK:- UIImagePickerController Methods
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

		var image: UIImage!

		//Handle is image was cropped or not
		if let img = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
			image = img
		} else if let img = info[UIImagePickerController.InfoKey.originalImage] as? UIImage	{
			image = img
		}

		imageView.image = image

		updateMemeView(getScaledImageRect(viewFrame: memeEditorView.frame, image: image))

		dismiss(animated: true, completion: nil)
	}


	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		dismiss(animated: true, completion: nil)
	}
}


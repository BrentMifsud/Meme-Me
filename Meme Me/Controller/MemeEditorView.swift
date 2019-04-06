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
	// MARK: UI Items
	@IBOutlet weak var navigationBar: UINavigationItem!
	@IBOutlet weak var actionButton: UIBarButtonItem!
	@IBOutlet weak var cancelButton: UIBarButtonItem!
	@IBOutlet weak var toolbar: UIToolbar!
	@IBOutlet weak var cameraButton: UIBarButtonItem!
	@IBOutlet weak var galleryButton: UIBarButtonItem!
	@IBOutlet weak var topTextField: UITextField!
	@IBOutlet weak var bottomTextField: UITextField!
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var memeContentView: UIView!

	// MARK: Constraints
	@IBOutlet weak var memeContentViewTopConstraint: NSLayoutConstraint!
	@IBOutlet weak var memeContentViewBottomConstraint: NSLayoutConstraint!
	@IBOutlet weak var memeContentViewLeftConstraint: NSLayoutConstraint!
	@IBOutlet weak var memeContentViewRightConstraint: NSLayoutConstraint!

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
		resetMemeContentsView()
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		subscribeToKeyboardNotifications()
	}

	override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
		super.viewWillTransition(to: size, with: coordinator)
		updateMemeContentView()
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
		resetMemeContentsView()
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

		updateMemeContentView()

		dismiss(animated: true, completion: nil)
	}


	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		dismiss(animated: true, completion: nil)
	}
}


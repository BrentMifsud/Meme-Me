//
//  HelperExtension.swift
//  Meme Me
//
//  Created by Brent Mifsud on 2019-03-18.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import UIKit

extension MemeEditorView {
	// Creates and saves the meme image to the data source.
	func saveMeme() {
		let meme = Meme(topText: topTextField.text ?? "", bottomText: bottomTextField.text ?? "", originalImage: imageView.image!, memedImage: generateMemedImage())

		let appDelegate = UIApplication.shared.delegate as! AppDelegate

		appDelegate.memes.append(meme)
	}

	func generateMemedImage() -> UIImage{
		// Create a CGRect equal to the size of the image on screen
		let drawArea = CGRect(origin: getImageOrigin(), size: getImageSize())

		// As of iOS 10, UIGraphicsImageRenderer is the new way to make images.
		// This creates an image cropping out the extra area from the UIImageView
		return UIGraphicsImageRenderer(bounds: drawArea).image { (context) in
			memeContentView.drawHierarchy(in: drawArea, afterScreenUpdates: true)
		}
	}

	// Return the CGSize of the image within the imageView
	func getImageSize() -> CGSize {
		let imageViewSize = imageView.bounds.size
		let imageSize = imageView.image!.size
		var minFactor = imageViewSize.width / imageSize.width

		if imageViewSize.height / imageSize.height < minFactor {
			minFactor = imageViewSize.height / imageSize.height
		}

		return CGSize(width: minFactor * imageSize.width, height: minFactor * imageSize.height)
	}

	// Return the image distance from the edge of the screen. Regardless of orientation or screen size.
	func getImageOrigin() -> CGPoint {
		let imageViewHeight = imageView.bounds.size.height
		let imageViewWidth = imageView.bounds.size.width
		let imageSize = getImageSize()

		if imageView.bounds.size.width > imageView.bounds.size.height {
			return CGPoint(x: ((imageViewWidth - imageSize.width) / 2), y: 0)
		} else {
			return CGPoint(x: 0, y: ((imageViewHeight - imageSize.height) / 2))
		}
	}
}

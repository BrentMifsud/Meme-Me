//
//  MemeCollectionViewCell.swift
//  Meme Me
//
//  Created by Brent Mifsud on 2019-04-01.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import UIKit

class MemeCollectionViewCell: UICollectionViewCell {
	@IBOutlet weak var cellImageView: UIImageView!
	@IBOutlet weak var cellTopText: UILabel!
	@IBOutlet weak var cellBottomText: UILabel!

	let textAttributes: [NSAttributedString.Key:Any] = [
		NSAttributedString.Key.strokeColor: UIColor.black,
		NSAttributedString.Key.foregroundColor: UIColor.white,
		NSAttributedString.Key.font: UIFont(name: "Impact", size: 12)!,
		NSAttributedString.Key.strokeWidth: -5
	]
}

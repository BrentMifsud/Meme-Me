//
//  MemeDetailViewController.swift
//  Meme Me
//
//  Created by Brent Mifsud on 2019-04-04.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController {

	var memeImage: UIImage!

	@IBOutlet weak var memeImageView: UIImageView!

	override func viewDidLoad() {
        super.viewDidLoad()
		memeImageView.image = memeImage
    }
}

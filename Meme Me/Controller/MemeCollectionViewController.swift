//
//  MemeCollectionViewController.swift
//  Meme Me
//
//  Created by Brent Mifsud on 2019-04-01.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import UIKit

class MemeCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

	@IBOutlet weak var flowLayout: UICollectionViewFlowLayout!

	var memes: [Meme]! {
		let appDelegate = UIApplication.shared.delegate as! AppDelegate

		return appDelegate.memes
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		collectionView.reloadData()
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		let space: CGFloat = 3.0
		let width = self.view.frame.size.width
		let height = self.view.frame.size.height

		var dimension: CGFloat

		if width < height {
			dimension = (width - (2 * space)) / 3.0
		} else {
			dimension = (height - (2 * space)) / 3.0
		}
		
		flowLayout.minimumInteritemSpacing = space
		flowLayout.minimumLineSpacing = space
		flowLayout.itemSize = CGSize(width: dimension, height: dimension)
	}

	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		return memes.count
	}

	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "memeCollectionCell", for: indexPath) as! MemeCollectionViewCell

		cell.cellTopText.text = memes[indexPath.row].topText
		cell.cellBottomText.text = memes[indexPath.row].bottomText
		cell.cellImageView.image = memes[indexPath.row].originalImage

		return cell
	}

	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		print("\(indexPath.row)")
	}
}

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

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
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

		if memes.count == 0 {
			setEmptyView()
		} else {
			restoreCollectionView()
		}

		return memes.count
	}

	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "memeCollectionCell", for: indexPath) as! MemeCollectionViewCell

		cell.cellImageView.image = memes[indexPath.row].memedImage

		return cell
	}

	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let controller = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
		controller.memeImage = memes[indexPath.row].memedImage
		self.navigationController!.pushViewController(controller, animated: true)
	}
}

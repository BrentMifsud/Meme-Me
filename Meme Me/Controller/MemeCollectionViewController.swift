//
//  MemeCollectionViewController.swift
//  Meme Me
//
//  Created by Brent Mifsud on 2019-04-01.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import UIKit

class MemeCollectionViewController: UICollectionViewController {

	var memes: [Meme]! {
		let appDelegate = UIApplication.shared.delegate as! AppDelegate

		return appDelegate.memes
	}

	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		return memes.count
	}

	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "memeCell", for: indexPath)

		return cell
	}

	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		print("\(indexPath.row)")
	}
}

//
//  MemeTableViewController.swift
//  Meme Me
//
//  Created by Brent Mifsud on 2019-04-01.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import UIKit

class MemeTableViewController: UITableViewController {

	var memes: [Meme]! {
		let appDelegate = UIApplication.shared.delegate as! AppDelegate
		return appDelegate.memes
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		let appDelegate = UIApplication.shared.delegate as! AppDelegate

		return appDelegate.memes.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "memeTableCell")
		cell?.imageView!.image = memes[indexPath.row].memedImage
		cell?.textLabel!.text = memes[indexPath.row].topText + " " + memes[indexPath.row].bottomText

		return cell!
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print("\(indexPath.row)")
	}


}

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

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		tableView.reloadData()
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		let appDelegate = UIApplication.shared.delegate as! AppDelegate

		return appDelegate.memes.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "memeTableCell")!
		cell.imageView!.image = memes[indexPath.row].originalImage
		cell.textLabel!.text = memes[indexPath.row].topText + " " + memes[indexPath.row].bottomText

		cell.textLabel!.font = UIFont(name: "Impact", size: 12)
		cell.textLabel!.textColor = .white

		return cell
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let controller = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
		controller.memeImage = memes[indexPath.row].memedImage
		self.navigationController!.pushViewController(controller, animated: true)
	}


}

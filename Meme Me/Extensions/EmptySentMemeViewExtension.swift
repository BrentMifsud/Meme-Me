//
//  MemeTableViewExtension.swift
//  Meme Me
//
//  Created by Brent Mifsud on 2019-04-22.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import UIKit

extension MemeCollectionViewController {
	func setEmptyView() {
		let emptyView = UIView(frame: CGRect(x: self.collectionView.frame.origin.x, y: self.collectionView.frame.origin.y, width: self.collectionView.bounds.size.width, height: self.collectionView.bounds.size.height))

		let titleLabel = UILabel()
		let pepeImageView = UIImageView(frame: CGRect(x: self.collectionView.center.x - 62.5, y: self.collectionView.center.y - 62.5, width: 125, height: 125))

		titleLabel.translatesAutoresizingMaskIntoConstraints = false

		// set text properties
		titleLabel.font = UIFont(name: "Impact", size: 20)
		titleLabel.textColor = .white
		titleLabel.textAlignment = .center
		titleLabel.numberOfLines = 2

		// add labels to view
		emptyView.addSubview(pepeImageView)
		emptyView.addSubview(titleLabel)

		pepeImageView.contentMode = .scaleAspectFit
		pepeImageView.image = UIImage(named: "pepeSad.png")

		titleLabel.topAnchor.constraint(equalTo: pepeImageView.bottomAnchor, constant: 8).isActive = true
		titleLabel.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 8).isActive = true
		titleLabel.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -8).isActive = true

		titleLabel.text = "Looks like there are no memes...\n Feels bad man..."

		self.collectionView.backgroundView = emptyView
	}

	func restoreCollectionView() {
		self.collectionView.backgroundView = nil
	}
}

extension MemeTableViewController {
	func setEmptyView() {
		let emptyView = UIView(frame: CGRect(x: self.tableView.frame.origin.x, y: self.tableView.frame.origin.y, width: self.tableView.bounds.size.width, height: self.tableView.bounds.size.height))

		let titleLabel = UILabel()
		let pepeImageView = UIImageView(frame: CGRect(x: self.tableView.center.x - 62.5, y: self.tableView.center.y - 62.5, width: 125, height: 125))

		titleLabel.translatesAutoresizingMaskIntoConstraints = false

		// set text properties
		titleLabel.font = UIFont(name: "Impact", size: 20)
		titleLabel.textColor = .white
		titleLabel.textAlignment = .center
		titleLabel.numberOfLines = 2

		// add labels to view
		emptyView.addSubview(pepeImageView)
		emptyView.addSubview(titleLabel)

		pepeImageView.contentMode = .scaleAspectFit
		pepeImageView.image = UIImage(named: "pepeSad.png")

		titleLabel.topAnchor.constraint(equalTo: pepeImageView.bottomAnchor, constant: 8).isActive = true
		titleLabel.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 8).isActive = true
		titleLabel.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -8).isActive = true

		titleLabel.text = "Looks like there are no memes...\n Feels bad man..."

		self.tableView.backgroundView = emptyView
		self.tableView.separatorStyle = .none
	}

	func restoreTableView() {
		self.tableView.backgroundView = nil
		self.tableView.separatorStyle = .singleLine
	}
}

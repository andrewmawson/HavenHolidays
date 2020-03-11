//
//  RootViewController.swift
//  HavenHolidays
//
//  Created by K10 on 11/03/2020.
//  Copyright © 2020 k10studios. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		let siteList = SiteListWireframe.createSiteListModule()
		navigationController?.setViewControllers([siteList], animated: false)
	}


}


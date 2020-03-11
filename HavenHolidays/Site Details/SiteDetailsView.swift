//
//  SiteDetailsView.swift
//  HavenHolidays
//
//  Created by K10 on 11/03/2020.
//  Copyright (c) 2020 k10studios. All rights reserved.
//

import UIKit

class SiteDetailsView: UIViewController {
	//MARK: - Variables
	var presenter: SiteDetailsPresenterProtocol?
	var site:SiteViewModel!
	private var groups:GroupsViewModel? {
		didSet {
			configureResults()
		}
	}
	
	@IBOutlet weak var siteTitleLabel: UILabel!
	@IBOutlet weak var totalGroupsLabel: UILabel!
	@IBOutlet weak var groupsSlider: UISlider!
	@IBOutlet weak var resultsLabel: UILabel!
	
	//MARK: - LifeCycle
	override func viewDidLoad() {
		super.viewDidLoad()
		assert(site != nil, "Site must not be nil")
		presenter?.interactor?.getGroup(forSite: site)
	}
	
	private func configureResults() {
		DispatchQueue.main.async {
			self.siteTitleLabel.text = self.site.title
			guard let groupsViewModel = self.groups else {
				return
			}
			let currentGroup = Int(self.groupsSlider.value - 1)
			let groupCount = groupsViewModel.groups.count
			self.groupsSlider.maximumValue = Float(groupCount)
			self.groupsSlider.minimumValue = Float(1)
			self.totalGroupsLabel.text = "Group \(currentGroup + 1) of \(groupCount)"
			let routeInfo = self.site.routeInfo(forGroups: groupsViewModel)[currentGroup]
			self.resultsLabel.text = routeInfo.displayText()
		}
	}

	
	@IBAction func groupSlider(_ sender: UISlider) {
		print(Int(sender.value))
		configureResults()
	}
}

extension SiteDetailsView {
	//MARK: - IBActions
}

extension SiteDetailsView: SiteDetailsViewProtocol {
	func display(groups: GroupsViewModel) {
		self.groups = groups
	}
}

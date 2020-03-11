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
		configureResults()
	}
	
	private func configureResults() {
		DispatchQueue.main.async {
			self.siteTitleLabel.text = self.site.title
			guard let groupsViewModel = self.groups else {
				return
			}
			
			let currentGroupIndex = Int(self.groupsSlider.value - 1)
			let groupCount = groupsViewModel.groups.count
			
			self.groupsSlider.maximumValue = Float(groupCount)
			self.groupsSlider.minimumValue = Float(1)
			
			self.totalGroupsLabel.text = "Group \(currentGroupIndex + 1) of \(groupCount)"
			
			//TODO: Potential performce hit to create routeInfo if there were 1,000, but is ok for now.
			let routeInfo = self.site.routeInfo(forGroups: groupsViewModel)[currentGroupIndex]
			self.resultsLabel.text = routeInfo.displayText()
		}
	}


}

extension SiteDetailsView {
	//MARK: - IBActions
	@IBAction func groupSlider(_ sender: UISlider) {
		configureResults()
	}
}

extension SiteDetailsView: SiteDetailsViewProtocol {
	func display(groups: GroupsViewModel) {
		self.groups = groups
	}
}

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
			
			let groupCount = groupsViewModel.groups.count
			self.groupsSlider.maximumValue = Float(groupCount)
			self.groupsSlider.minimumValue = Float(1)
			self.totalGroupsLabel.text = "Group \(Int(self.groupsSlider.value)) of \(groupCount)"
			self.resultsLabel.text = self.resultText()
		}
	}
	
	// TO DO: Move recursive mins for each group until current croupt
	
	private func resultText() -> String {
		// TO DO: Move this to View model
		if let currentGroup = groups?.groups[Int(self.groupsSlider.value) - 1] {
			if let clockWiseMins = minutesToCaravan(for: Routes.clockWise, caravanId: currentGroup.caravan) {
				return "Family \(currentGroup.familyid) took \(clockWiseMins) minutes\n\nRoute: Clockwise"
			}
			
			if let antiClockWiseMins = minutesToCaravan(for: Routes.antiClockWise, caravanId: currentGroup.caravan) {
				return "Family \(currentGroup.familyid) took \(antiClockWiseMins) minutes\n\nRoute: Anti clockwise"
			}
			
			if let central = minutesToCaravan(for: Routes.central, caravanId: currentGroup.caravan) {
				return "Family \(currentGroup.familyid) took \(central) minutes\n\nRoute: Central "
			}
		}
		return "Unknown error"
	}
	
	private func minutesToCaravan(for Route:Routes, caravanId:CaravanId) -> Int? {
		// TO DO: Move this to View model
		if let routeMins = site.routes[Route]?.firstIndex(of: caravanId) {
			return routeMins + 1
		}
		return nil
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

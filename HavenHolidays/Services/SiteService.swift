//
//  SiteService.swift
//  HavenHolidays
//
//  Created by K10 on 11/03/2020.
//  Copyright © 2020 k10studios. All rights reserved.
//

import Foundation

class SiteService {
	private var sites:[SiteViewModel] = []
	let networkService = NetworkService()
	
	func getSites() -> [SiteViewModel] {
		return self.sites.count == 0 ? createSites() : self.sites
	}
	
	func getGroups(forSite site:SiteViewModel, completionBlock:@escaping( (GroupsViewModel?) -> () )) {
		networkService.getGroupData(withUrl: site.dataURL) { (groups) in
			completionBlock(groups)
		}
		return completionBlock(nil)
	}
	
	private func createSites() -> [SiteViewModel] {
		self.sites = [losAngelesSite()]
		return self.sites
	}
	
	private func losAngelesSite() -> SiteViewModel {
		let laUrl = URL(string:  "https://haven-tech-test.s3-eu-west-1.amazonaws.com/tech+test+json.json")!
		let routes = [
			Routes.antiClockWise:[1,2,3,4,5,6,7],
			Routes.clockWise:[1,13,12,11,10,9],
			Routes.central:[1,13,16,15,14,8]
		]
		let losAngeles = SiteViewModel(title: "Los Angeles", dataURL:laUrl, routes: routes )
		return losAngeles
	}
	
	
}

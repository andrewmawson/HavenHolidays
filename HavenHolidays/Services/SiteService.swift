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
		let laUrl = URL(string:  "https://haven-tech-test.s3-eu-west-1.amazonaws.com/tech+test+json.json")!
		let losAngeles = SiteViewModel(title: "Los Angeles", dataURL:laUrl )
		self.sites = [losAngeles]
		return self.sites
	}
	
	
}

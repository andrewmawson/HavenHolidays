//
//  SiteDetailsInteractor.swift
//  HavenHolidays
//
//  Created by K10 on 11/03/2020.
//  Copyright (c) 2020 k10studios. All rights reserved.
//

class SiteDetailsInteractor: SiteDetailsInteractorInputProtocol {
	let siteService = SiteService()
	func getGroup(forSite site: SiteViewModel) {
		siteService.getGroups(forSite: site) { (groups) in
			if let groups = groups {
				self.presenter?.has(groups: groups)
			}else{
				// TODO: Error handling or no group data returned
			}
		}
	}
	
    weak var presenter: SiteDetailsInteractorOutputProtocol?
}

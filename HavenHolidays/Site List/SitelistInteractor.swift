//
//  SiteListInteractor.swift
//  HavenHolidays
//
//  Created by K10 on 11/03/2020.
//  Copyright (c) 2020 k10studios. All rights reserved.
//

class SiteListInteractor: SiteListInteractorInputProtocol {
	private let siteService = SiteService()
	func getSites() {
		let sites = siteService.getSites()
		presenter?.hasSites(sites: sites)
	}
	
    weak var presenter: SiteListInteractorOutputProtocol?
}

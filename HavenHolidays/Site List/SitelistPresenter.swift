//
//  SiteListPresenter.swift
//  HavenHolidays
//
//  Created by K10 on 11/03/2020.
//  Copyright (c) 2020 k10studios. All rights reserved.

class SiteListPresenter: SiteListPresenterProtocol {
    weak var view: SiteListViewProtocol?
	var interactor: SiteListInteractorInputProtocol?
    var wireframe: SiteListWireframeProtocol?
}

extension SiteListPresenter: SiteListInteractorOutputProtocol {
	func hasSites(sites: [SiteViewModel]) {
		view?.display(sites: sites)
	}
	
    
}

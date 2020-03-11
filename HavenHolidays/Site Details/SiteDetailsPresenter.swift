//
//  SiteDetailsPresenter.swift
//  HavenHolidays
//
//  Created by K10 on 11/03/2020.
//  Copyright (c) 2020 k10studios. All rights reserved.

class SiteDetailsPresenter: SiteDetailsPresenterProtocol {
    weak var view: SiteDetailsViewProtocol?
	var interactor: SiteDetailsInteractorInputProtocol?
    var wireframe: SiteDetailsWireframeProtocol?
}

extension SiteDetailsPresenter: SiteDetailsInteractorOutputProtocol {
	func has(groups: [GroupViewModel]) {
		view?.display(groups: groups)
	}
	
    
}

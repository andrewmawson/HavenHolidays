//
//  SitelistPresenter.swift
//  HavenHolidays
//
//  Created by K10 on 11/03/2020.
//  Copyright (c) 2020 k10studios. All rights reserved.

class SitelistPresenter: SitelistPresenterProtocol {
    weak var view: SitelistViewProtocol?
	var interactor: SitelistInteractorInputProtocol?
    var wireframe: SitelistWireframeProtocol?
}

extension SitelistPresenter: SitelistInteractorOutputProtocol {
    
}

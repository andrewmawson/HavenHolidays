//
//  SiteDetailsProtocols.swift
//  HavenHolidays
//
//  Created by K10 on 11/03/2020.
//  Copyright (c) 2020 k10studios. All rights reserved.
//
import UIKit

protocol SiteDetailsViewProtocol: class {
    	func display(groups:[GroupViewModel])
}

protocol SiteDetailsPresenterProtocol: class {
    var view: SiteDetailsViewProtocol? { get set }
    var interactor: SiteDetailsInteractorInputProtocol? { get set }
    var wireframe: SiteDetailsWireframeProtocol? { get set }
}

protocol SiteDetailsInteractorInputProtocol: class {
    var presenter: SiteDetailsInteractorOutputProtocol? { get set }
	func getGroup(forSite site:SiteViewModel)
}

protocol SiteDetailsInteractorOutputProtocol: class {
	func has(groups:[GroupViewModel])
}

protocol SiteDetailsWireframeProtocol: class {
	static func createSiteDetailsModule(withSite site:SiteViewModel) -> UIViewController
}

//
//  SiteListProtocols.swift
//  HavenHolidays
//
//  Created by K10 on 11/03/2020.
//  Copyright (c) 2020 k10studios. All rights reserved.
//
import UIKit

protocol SiteListViewProtocol: class {
    
}

protocol SiteListPresenterProtocol: class {
    var view: SiteListViewProtocol? { get set }
    var interactor: SiteListInteractorInputProtocol? { get set }
    var wireframe: SiteListWireframeProtocol? { get set }
}

protocol SiteListInteractorInputProtocol: class {
    var presenter: SiteListInteractorOutputProtocol? { get set }
}

protocol SiteListInteractorOutputProtocol: class {
}

protocol SiteListWireframeProtocol: class {
    static func createSiteListModule() -> UIViewController
}

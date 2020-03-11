//
//  SitelistProtocols.swift
//  HavenHolidays
//
//  Created by K10 on 11/03/2020.
//  Copyright (c) 2020 k10studios. All rights reserved.
//
import UIKit

protocol SitelistViewProtocol: class {
    
}

protocol SitelistPresenterProtocol: class {
    var view: SitelistViewProtocol? { get set }
    var interactor: SitelistInteractorInputProtocol? { get set }
    var wireframe: SitelistWireframeProtocol? { get set }
}

protocol SitelistInteractorInputProtocol: class {
    var presenter: SitelistInteractorOutputProtocol? { get set }
}

protocol SitelistInteractorOutputProtocol: class {
}

protocol SitelistWireframeProtocol: class {
    static func createSitelistModule() -> UIViewController
}

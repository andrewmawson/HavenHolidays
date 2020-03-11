//
//  SitelistWireframe.swift
//  HavenHolidays
//
//  Created by K10 on 11/03/2020.
//  Copyright (c) 2020 k10studios. All rights reserved.
//
import UIKit

class SitelistWireframe:  SitelistWireframeProtocol {
    static func createSitelistModule() -> UIViewController {
        guard let view = UIStoryboard(name: "SitelistView", bundle: nil).instantiateViewController(withIdentifier: "SitelistView") as? SitelistView else {
            return UIViewController()
        }
        let presenter: SitelistPresenterProtocol & SitelistInteractorOutputProtocol = SitelistPresenter()
        let interactor: SitelistInteractorInputProtocol = SitelistInteractor()
        let wireframe: SitelistWireframeProtocol = SitelistWireframe()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        interactor.presenter = presenter
        
        return view
    }
    
}

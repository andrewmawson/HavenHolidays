//
//  SiteListWireframe.swift
//  HavenHolidays
//
//  Created by K10 on 11/03/2020.
//  Copyright (c) 2020 k10studios. All rights reserved.
//
import UIKit

class SiteListWireframe:  SiteListWireframeProtocol {
    static func createSiteListModule() -> UIViewController {
        guard let view = UIStoryboard(name: "SiteListView", bundle: nil).instantiateViewController(withIdentifier: "SiteListView") as? SiteListView else {
            return UIViewController()
        }
        let presenter: SiteListPresenterProtocol & SiteListInteractorOutputProtocol = SiteListPresenter()
        let interactor: SiteListInteractorInputProtocol = SiteListInteractor()
        let wireframe: SiteListWireframeProtocol = SiteListWireframe()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        interactor.presenter = presenter
        
        return view
    }
	
	func showSiteDetails(from view: SiteListView, site:SiteViewModel) {
		let details = SiteDetailsWireframe.createSiteDetailsModule()
		view.show(details, sender: self)
	}
    
}

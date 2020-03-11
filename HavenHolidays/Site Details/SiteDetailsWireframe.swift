//
//  SiteDetailsWireframe.swift
//  HavenHolidays
//
//  Created by K10 on 11/03/2020.
//  Copyright (c) 2020 k10studios. All rights reserved.
//
import UIKit

class SiteDetailsWireframe:  SiteDetailsWireframeProtocol {
	static func createSiteDetailsModule(withSite site:SiteViewModel) -> UIViewController {
        guard let view = UIStoryboard(name: "SiteDetailsView", bundle: nil).instantiateViewController(withIdentifier: "SiteDetailsView") as? SiteDetailsView else {
            return UIViewController()
        }
        let presenter: SiteDetailsPresenterProtocol & SiteDetailsInteractorOutputProtocol = SiteDetailsPresenter()
        let interactor: SiteDetailsInteractorInputProtocol = SiteDetailsInteractor()
        let wireframe: SiteDetailsWireframeProtocol = SiteDetailsWireframe()
        
        view.presenter = presenter
		view.site = site
        presenter.view = view
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        interactor.presenter = presenter
        
        return view
    }
    
}

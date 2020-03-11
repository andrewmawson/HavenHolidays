//
//  SiteDetailsView.swift
//  HavenHolidays
//
//  Created by K10 on 11/03/2020.
//  Copyright (c) 2020 k10studios. All rights reserved.
//

import UIKit

class SiteDetailsView: UIViewController {
    //MARK: - Variables
    var presenter: SiteDetailsPresenterProtocol?
	var site:SiteViewModel!
	
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
		assert(site != nil, "Site must not be nil")
		print(site!)
    }
}

extension SiteDetailsView {
	//MARK: - IBActions
}

extension SiteDetailsView: SiteDetailsViewProtocol {
    
}

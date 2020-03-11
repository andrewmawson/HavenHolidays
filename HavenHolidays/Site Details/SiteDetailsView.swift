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
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SiteDetailsView {
	//MARK: - IBActions
}

extension SiteDetailsView: SiteDetailsViewProtocol {
    
}

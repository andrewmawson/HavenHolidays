//
//  SitelistView.swift
//  HavenHolidays
//
//  Created by K10 on 11/03/2020.
//  Copyright (c) 2020 k10studios. All rights reserved.
//

import UIKit

class SitelistView: UIViewController {
    //MARK: - Variables
    var presenter: SitelistPresenterProtocol?
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SitelistView {
	//MARK: - IBActions
}

extension SitelistView: SitelistViewProtocol {
    
}

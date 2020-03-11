//
//  SiteListView.swift
//  HavenHolidays
//
//  Created by K10 on 11/03/2020.
//  Copyright (c) 2020 k10studios. All rights reserved.
//

import UIKit

class SiteListView: UIViewController {
    //MARK: - Variables
    var presenter: SiteListPresenterProtocol?
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SiteListView {
	//MARK: - IBActions
}

extension SiteListView: SiteListViewProtocol {
    
}

//
//  SiteListView.swift
//  HavenHolidays
//
//  Created by K10 on 11/03/2020.
//  Copyright (c) 2020 k10studios. All rights reserved.
//

import UIKit

class SiteListView: UITableViewController {
    //MARK: - Variables
    var presenter: SiteListPresenterProtocol?
	private var sites:[SiteViewModel] = []
   
	//MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
		presenter?.interactor?.getSites()
    }
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return sites.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "SiteCell")
		let site = sites[indexPath.row]
		cell?.textLabel?.text = site.title
		return cell!
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let site = sites[indexPath.row]
		presenter?.wireframe?.showSiteDetails(from: self, site: site)
	}
}

extension SiteListView {
	//MARK: - IBActions
}

extension SiteListView: SiteListViewProtocol {
	func display(sites: [SiteViewModel]) {
		self.sites = sites
		DispatchQueue.main.async {
			self.tableView.reloadData()
		}
	}
	
    
}

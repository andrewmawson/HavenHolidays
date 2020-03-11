//
//  SiteViewModel.swift
//  HavenHolidays
//
//  Created by K10 on 11/03/2020.
//  Copyright © 2020 k10studios. All rights reserved.
//

import Foundation

typealias CaravanId = Int

struct SiteViewModel {
	let title:String
	let dataURL:URL
	let routes:[Routes:[CaravanId]]
	
	func routeInfo(forGroups groups:GroupsViewModel) -> [RouteInfoViewModel] {
		var allRouteInfo:[RouteInfoViewModel] = []
		var totalMins = 0
		
		for (_ /*index*/, group) in groups.groups.enumerated() {
			let routeInfo = RouteInfoViewModel(minutesWait: totalMins, routeTaken: routeFor(caravanId: group.caravan))
			allRouteInfo.append(routeInfo)
			totalMins = totalMins + minutesToCaravan(caravanId: group.caravan)
		}
		return allRouteInfo
	}
	
	private func routeFor(caravanId:CaravanId) -> Routes {
		for key in routes.keys {
			if let _ = self.routes[key]?.firstIndex(of: caravanId) {
				return key
			}
		}
		return .unknown
	}
	
	private func minutesToCaravan(caravanId:CaravanId) -> Int {
		let route = routeFor(caravanId: caravanId)
		if let index = routes[route]?.firstIndex(of: caravanId) {
			return index + 1
		}else{
			assert(false)
			return 0
		}
		
	}
}

enum Routes {
	case unknown
	case clockWise
	case antiClockWise
	case central
}

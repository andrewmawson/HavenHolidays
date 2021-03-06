//
//  RouteInfoViewModel.swift
//  HavenHolidays
//
//  Created by K10 on 11/03/2020.
//  Copyright © 2020 k10studios. All rights reserved.
//

import Foundation

struct RouteInfoViewModel {
	let minutesWait:Int
	let routeTaken:Routes
	
	func displayText() -> String {
		return "Minutes Wait: \(minutesWait)\nRoute: \(routeTaken)"
	}
}

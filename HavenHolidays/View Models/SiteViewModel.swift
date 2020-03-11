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
}

enum Routes {
	case clockWise
	case antiClockWise
	case central
}

//
//  NetworkService.swift
//  HavenHolidays
//
//  Created by K10 on 11/03/2020.
//  Copyright © 2020 k10studios. All rights reserved.
//

import Foundation

class NetworkService: NSObject {
	private let baseURL = "https://haven-tech-test.s3-eu-west-1.amazonaws.com/"
	private let session = URLSession.shared
	
	func getGroupData(withUrl url:URL, completionBlock:@escaping( (GroupsViewModel?) -> () )){
			let task = session.dataTask(with: url, completionHandler: { data, response, error in
				let decoder = JSONDecoder()
				do {
					if let data = data {
						let decodedGroups = try decoder.decode([GroupViewModel].self, from: data)
						let groupsViewModel = GroupsViewModel(groups: decodedGroups)
						completionBlock(groupsViewModel)
					}else{
						completionBlock(nil)
					}

				} catch {
					completionBlock(nil)
				}
			})
			
			task.resume()
	}

}

//
//  HomeViewModal.swift
//  Expireley
//
//  Created by Zayn on 4/10/22.
//

import Foundation
import CoreData
import SwiftUI

class HomeViewModal: ObservableObject {
	
	// MARK: CORE DATA
	let manager = CoreDataManager.instance
	@Published var savedIn: [Storage] = []
	@Published var willBeUpdated: Storage!
	
	@Published var addSheet = false
	@Published var title = ""
	@Published var category = ""
	@Published var expire = Date()
	@Published var cardColor = ""
	@Published var isExpired  : Bool = false
	@Published var colors = ["red", "blue", "yellow", "pink", "purple", "orange", "green", "Brown"]
	
	init() {
		fetchFromStorage()
	}
	
	func fetchFromStorage() {
		let data = NSFetchRequest<Storage>(entityName: "Storage")
		do {
			savedIn = try manager.context.fetch(data)
		} catch {
			print("ERROR FETCHING")
		}
		
	}
	
	func addToStorage() {
		if willBeUpdated == nil {
			let new = Storage(context: manager.context)
			new.title = title
			new.cardColor = cardColor
			new.expire = expire
			new.category = category
			new.isExpired = isExpired
		} else {
			willBeUpdated.title = title
			willBeUpdated.cardColor = cardColor
			willBeUpdated.expire = expire
			willBeUpdated.category = category
			
		}
		
		willBeUpdated = nil
		save()
		addSheet.toggle()
		
		title = ""
		expire = Date()
		cardColor = ""
		category = ""
		
	}
	
	func update(data: Storage) {
		willBeUpdated = data
		title = data.title ?? ""
		cardColor = data.cardColor ?? ""
		expire = data.expire ?? Date()
		category = data.category ?? ""
		
		save()
	}
	
	func delete(data: Storage) {
		manager.context.delete(data)
		save()
	}
	
	//Pin to top
	func pin(data: Storage) {
		data.isExpired.toggle()
		save()
	}
	
	
	//Save into core data
	func save() {
		manager.save()
		fetchFromStorage()
	}
	
	
	func pickCardColor(cardColor: String) -> Color {
		switch cardColor {
		case "red":
			return Color.red 
		case "blue":
			return Color.blue
		case "yellow":
			return Color.yellow
		case "pink":
			return Color.pink
		case "purple":
			return Color.purple
		case "orange":
			return Color.orange
		case "green":
			return Color.green
		case "Brown":
			return Color.brown
		default:
			return Color.white
		}
	}
	
	
}

//
//  RowView.swift
//  Expireley
//
//  Created by Zayn on 4/10/22.
//

import SwiftUI

struct RowView: View {
	
	let saved: Storage
	@ObservedObject var vm: HomeViewModal
	
    var body: some View {
		HStack {
		VStack(alignment: .leading) {
			
			HStack {
				Text(saved.title ?? "")
					.foregroundColor(Color.primary)
					.font(.system(size: 20))
					.bold()
				
				Text(saved.category ?? "")
					.foregroundColor(Color.white)
					.font(.system(size: 12))
					.padding(.vertical, 2)
					.padding(.horizontal, 7)
					.background(Color.black)
					.cornerRadius(7)
				Spacer()
			}
			
			
			
			HStack {
				Text("exp on")
			Text("\(saved.expire ?? Date(), style: .date)")
					.foregroundColor(.primary)
					.font(.system(size: 13))
					.padding(.horizontal, 10)
					.padding(.vertical, 2)
					.background(Color.white)
					.cornerRadius(100)
					.shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 0)
				
				Spacer()
				
			}
			
		}
		
			
			Menu {
				Button(action: {
					vm.pin(data: saved)
				}){
					Text(saved.isExpired ? "Unmark" : "Mark Expiring Soon")
					Image(systemName:saved.isExpired ?  "pin.circle" : "pin.circle.fill")
				}
				
				Button(action: {
					vm.update(data: saved)
					vm.addSheet.toggle()
				}){
					Text("Update")
					Image(systemName: "pencil.circle")
				}
				
				Button(action: {
					vm.delete(data: saved)
				}){
					Text("Delete")
					Image(systemName: "trash.circle")
				}
			} label: {
				Image(systemName: "ellipsis")
					.rotationEffect(.degrees(90))
					.padding(.horizontal, 2)
					.padding(.vertical, 14)
					.foregroundColor(Color.white)
					.background(Color.black.opacity(0.5))
					.cornerRadius(7)
			}
			
		}
		.padding()
		.frame(maxWidth: .infinity, maxHeight: 80)
		.background(vm.pickCardColor(cardColor: saved.cardColor ?? ""))
		.cornerRadius(13)
		.shadow(color: Color.black.opacity(0.5), radius: 1, x: 0, y: 0)
		.padding(.horizontal)
		.padding(.vertical, 9)
		
		
    }
}

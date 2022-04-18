//
//  AddNewView.swift
//  Expireley
//
//  Created by Zayn on 4/11/22.
//

import SwiftUI

struct AddNewView: View {
	
	@ObservedObject var vm: HomeViewModal
	
    var body: some View {
		VStack {
			HStack {
				Text(vm.willBeUpdated == nil ? "Add A New Item" : "Update Item")
					.font(.system(size: 60, weight: .thin, design: .rounded))
					.padding()
				
				Spacer()
			}
			
			TextField("Item title", text: $vm.title)
				.padding()
				.background(vm.pickCardColor(cardColor: vm.cardColor))
				.background()
				.cornerRadius(13)
				.shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 0)
				.padding()
			
			TextField("Item Category", text: $vm.category)
				.padding()
				.background(.white)
				.background()
				.cornerRadius(13)
				.shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 0)
				.padding(.vertical, 2)
				.padding(.horizontal)
			
			DatePicker("Expiration Data", selection: $vm.expire, displayedComponents: .date)
				.padding()
				.background(.white)
				.cornerRadius(13)
				.shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 0)
				.padding(.top, 10)
				.padding(.bottom, 10)
				.padding(.horizontal)
			
			HStack {
				ForEach(vm.colors, id: \.self) { pickedColor in
					Button(action: {
						vm.cardColor = pickedColor
					}){
						
						if vm.cardColor == pickedColor {
							Spacer()
							Circle()
								.fill(vm.pickCardColor(cardColor: pickedColor))
								.background(Color.black)
								.frame(width: 21, height: 21)
								.cornerRadius(100)
								.shadow(color: Color.black.opacity(0.9), radius: 3, x: 0, y: 0)
							Spacer()
						} else {
							Spacer()
							Circle()
								.fill(vm.pickCardColor(cardColor: pickedColor))
								.frame(width: 20, height: 20)
							Spacer()
						}
					   
						
					}
				}
			}
			.padding()
			.background(vm.pickCardColor(cardColor: vm.cardColor))
			.cornerRadius(13)
			.shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 0)
			.padding(.vertical, 2)
			.padding(.horizontal)
			Spacer()
			Button(action: {
				vm.addToStorage()
			}){
				Text("Save Item")
			}
			.foregroundColor(Color.white)
			.padding()
			.frame(maxWidth: .infinity)
			.background(Color.pink)
			.cornerRadius(10)
			.padding()
			
			
		}
    }
}

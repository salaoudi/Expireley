//
//  HomeView.swift
//  Expireley
//
//  Created by Zayn on 4/10/22.
//

import SwiftUI

struct HomeView: View {
	
	@ObservedObject var vm : HomeViewModal
	
    var body: some View {
		ZStack {
			
			
			ZStack {
				HStack {
					HStack {
					Text("Expireley")
							.padding(.vertical, 5)
							.padding(.horizontal, 13)
							.foregroundColor(.white)
							.font(.system(size: 25, weight: .heavy, design: .rounded))
							.background(Color.black)
							.cornerRadius(100)
							.frame(width: 200, height: 70, alignment: .leading)
						
						
					}
					
				}
				.padding(.horizontal)
				
				Spacer()
			}
			.zIndex(100)
			.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
			
			
			ScrollView(.vertical) {
				VStack {
					HStack {
						Text("Expiring Soon")
							.foregroundColor(Color.pink)
							.font(.system(size: 30, weight: .heavy, design: .rounded))
						Spacer()
						
					}
					.padding(.top, 80)
					.padding(.horizontal)
					VStack {
						ForEach(vm.savedIn.filter{ $0.isExpired == true }) { saved in
							RowView(saved: saved, vm: vm)
						}
					}
				}
				VStack {
					HStack {
						Text("Recent")
							.foregroundColor(Color.green)
							.font(.system(size: 30, weight: .heavy, design: .rounded))
						Spacer()
					}
					.padding(.top, 10)
					.padding(.horizontal)
					VStack {
					   
						ForEach(vm.savedIn.filter{ $0.isExpired == false }) { saved in
							RowView(saved: saved, vm: vm)
								.sheet(isPresented: $vm.addSheet) {
									AddNewView(vm: vm)
								}
						}
						
						}
						
						
					}
				}
			
			ZStack {
				
				Button(action: {
					vm.addSheet.toggle()
				}){
					Image(systemName: "plus")
				}
			}
			.padding()
			.foregroundColor(Color.white)
			.background(Color.pink)
			.cornerRadius(15)
			.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
			.shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 0)
			.padding(.horizontal)
			
			
			}
		.sheet(isPresented: $vm.addSheet) {
			AddNewView(vm: vm)
		}
		
			.zIndex(-1)
			
			
			
		}
    }


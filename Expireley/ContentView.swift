//
//  ContentView.swift
//  Expireley
//
//  Created by Zayn on 4/10/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
	@StateObject var vm = HomeViewModal()
    var body: some View {
		HomeView(vm: vm)
    }

  
    }



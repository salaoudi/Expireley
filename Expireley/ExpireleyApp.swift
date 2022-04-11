//
//  ExpireleyApp.swift
//  Expireley
//
//  Created by Zayn on 4/10/22.
//

import SwiftUI

@main
struct ExpireleyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

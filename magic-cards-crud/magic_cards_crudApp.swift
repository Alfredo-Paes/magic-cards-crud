//
//  magic_cards_crudApp.swift
//  magic-cards-crud
//
//  Created by Alfredo Paes da Luz on 05/10/23.
//

import SwiftUI

@main
struct magic_cards_crudApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MagicCardListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

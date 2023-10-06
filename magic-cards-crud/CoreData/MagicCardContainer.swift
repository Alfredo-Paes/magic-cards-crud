//
//  MagicCardContainer.swift
//  magic-cards-crud
//
//  Created by Alfredo Paes da Luz on 05/10/23.
//

import Foundation
import CoreData

class MagicCardContainer {
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "magic_cards_crud")
        persistentContainer.loadPersistentStores { _, error in
            if let error {
                print(error.localizedDescription)
            }
        }
    }
}

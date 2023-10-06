//
//  MagicCard.swift
//  magic-cards-crud
//
//  Created by Alfredo Paes da Luz on 06/10/23.
//

import UIKit

extension MagicCard {
    var idCard: String {
        id ?? ""
    }
    
    var nameCard: String {
        name ?? ""
    }
    
    var textCard: String {
        text ?? ""
    }
    
    var flavorCard: String {
        flavor ?? ""
    }
    
    var manaCosCardt: String {
        manaCost ?? ""
    }
    
    var powerCard: String {
        power ?? ""
    }
    
    var toughnessCard: String {
        toughness ?? ""
    }
    
    var typeCard: String {
        type ?? ""
    }
}

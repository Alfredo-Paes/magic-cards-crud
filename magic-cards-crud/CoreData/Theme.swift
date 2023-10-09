//
//  Theme.swift
//  magic-cards-crud
//
//  Created by Alfredo Paes da Luz on 08/10/23.
//

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
    
    var manaColorCard: String {
        manaColor ?? ""
    }
    
    var manaCostCard: String {
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
    
    var imageCard: UIImage {
        if !idCard.isEmpty,
           let image = FileManager().retrieveImage(with: idCard) {
            return image
        } else {
            return UIImage(systemName: "photo")!
        }
    }
}

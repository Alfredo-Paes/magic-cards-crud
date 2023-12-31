//
//  MagicCardFormViewModel.swift
//  magic-cards-crud
//
//  Created by Alfredo Paes da Luz on 06/10/23.
//

import UIKit

class MagicCardFormViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var text: String = ""
    @Published var flavor: String = ""
    @Published var manaColor: String = ""
    @Published var manaCost: String = ""
    @Published var power: String = ""
    @Published var toughness: String = ""
    @Published var type: String = ""
    @Published var imageCard: UIImage
    
    var id: String?
    var updating: Bool { id != nil }
    
    init(_ imageCard: UIImage){
        self.imageCard = imageCard
    }
    
    init(_ magicCard: MagicCard) {
        id = magicCard.idCard
        name = magicCard.nameCard
        text = magicCard.textCard
        flavor = magicCard.flavorCard
        manaColor = magicCard.manaColorCard
        manaCost = magicCard.manaCostCard
        power = magicCard.powerCard
        toughness = magicCard.toughnessCard
        type = magicCard.typeCard
        imageCard = magicCard.imageCard
    }
    
    var unfineshed: Bool {
        name.isEmpty || imageCard == UIImage(systemName: "photo")
    }
}

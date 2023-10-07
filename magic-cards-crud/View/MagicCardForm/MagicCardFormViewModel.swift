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
    @Published var manaCost: String = ""
    @Published var power: String = ""
    @Published var toughness: String = ""
    @Published var type: String = ""
    @Published var imageCard: UIImage
    
    var id: String?
    //var updating: Bool { id != nil }
    var updating: Bool = true
    
    init(_ imageCard: UIImage){
        self.imageCard = imageCard
    }
    
    init(_ magicCard: MagicCard) {
        name = magicCard.nameCard
        text = magicCard.textCard
        flavor = magicCard.flavorCard
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

//
//  MagicFormType.swift
//  magic-cards-crud
//
//  Created by Alfredo Paes da Luz on 07/10/23.
//

import SwiftUI

enum MagicCardFormType: Identifiable, View {
    case new(UIImage)
    case update(MagicCard)
    
    var id: String {
        switch self {
            case.new:
                return "new"
            case.update:
                return "update"
        }
    }
    
    var body: some View {
        switch self {
        case.new(let uiImage):
            return MagicCardFormView(magicCardFormViewModel: MagicCardFormViewModel(uiImage))
        case.update(let magicCard):
            return MagicCardFormView(magicCardFormViewModel: MagicCardFormViewModel(magicCard))
        }
    }
}

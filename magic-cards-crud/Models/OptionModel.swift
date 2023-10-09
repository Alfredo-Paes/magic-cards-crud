//
//  OptionModel.swift
//  magic-cards-crud
//
//  Created by Alfredo Paes da Luz on 08/10/23.
//

import UIKit

class OptionModel: ObservableObject {
    @Published var themeApp: Bool = false
    
    
    init(_ options: Options) {
        themeApp = options.theme
    }
    
}

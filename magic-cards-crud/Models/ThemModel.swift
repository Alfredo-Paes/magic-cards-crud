//
//  ThemModel.swift
//  magic-cards-crud
//
//  Created by Alfredo Paes da Luz on 08/10/23.
//

import Foundation
import UIKit

class ThemeModel: ObservableObject {
    @Published var theme: Bool = false
    init(_ theme: Bool) {
        self.theme = theme
    }
}

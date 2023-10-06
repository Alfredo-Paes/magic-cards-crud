//
//  MagicCardFormView.swift
//  magic-cards-crud
//
//  Created by Alfredo Paes da Luz on 06/10/23.
//

import SwiftUI

struct MagicCardFormView: View {
    
    @ObservedObject var magicCardFormViewModel: MagicCardFormViewModel
    
    var body: some View {
        NavigationStack {
            TextField("Nome da Carta", text: $magicCardFormViewModel.name)
                .padding()
                .frame(width: 335, height: 50)
                .background(Color(uiColor: .systemGray6))
                .cornerRadius(12)
            TextField("Descrição", text: $magicCardFormViewModel.text)
                .padding()
                .frame(width: 335, height: 50)
                .background(Color(uiColor: .systemGray6))
                .cornerRadius(12)
            TextField("Frase", text: $magicCardFormViewModel.flavor)
                .padding()
                .frame(width: 335, height: 50)
                .background(Color(uiColor: .systemGray6))
                .cornerRadius(12)
            TextField("Custo de Mana", text: $magicCardFormViewModel.manaCost)
                .padding()
                .frame(width: 335, height: 50)
                .background(Color(uiColor: .systemGray6))
                .cornerRadius(12)
            TextField("Poder", text: $magicCardFormViewModel.power)
                .padding()
                .frame(width: 335, height: 50)
                .background(Color(uiColor: .systemGray6))
                .cornerRadius(12)
            TextField("Desfesa", text: $magicCardFormViewModel.toughness)
                .padding()
                .frame(width: 335, height: 50)
                .background(Color(uiColor: .systemGray6))
                .cornerRadius(12)
            TextField("Tipo", text: $magicCardFormViewModel.type)
                .padding()
                .frame(width: 335, height: 50)
                .background(Color(uiColor: .systemGray6))
                .cornerRadius(12)
                Button("Cadastrar") {
                    print("Carta Cadastrada!")
                }
                .foregroundColor(.white)
                .font(.title3)
                .bold()
                .frame(width: 335, height: 50)
                .background(Color.purple)
                .cornerRadius(12)
        }
    }
}

struct MagicCardFormView_Previews: PreviewProvider {
    static var previews: some View {
        MagicCardFormView(magicCardFormViewModel: MagicCardFormViewModel(UIImage(systemName: "photo")!))
    }
}

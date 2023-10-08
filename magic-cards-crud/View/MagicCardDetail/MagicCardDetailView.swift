//
//  MagicCardDetailView.swift
//  magic-cards-crud
//
//  Created by Alfredo Paes da Luz on 07/10/23.
//

import SwiftUI

struct MagicCardDetailView: View {
    @ObservedObject var magicCardDetailView:MagicCardFormViewModel
    @FetchRequest(sortDescriptors: [])
    private var magicCard: FetchedResults<MagicCard>
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Image(uiImage: magicCardDetailView.imageCard)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 335, height: 700)
                        .padding()
                    HStack {
                        Text("Nome da Carta")
                        Text(magicCardDetailView.name)
                    }
                    HStack {
                        Text("Descrição")
                        Text(magicCardDetailView.text)
                    }
                    HStack {
                        Text("Frase")
                        Text(magicCardDetailView.flavor)
                    }
                    HStack {
                        Text("Custo de Mana")
                        Text(magicCardDetailView.manaCost)
                    }
                    HStack {
                        Text("Poder")
                        Text(magicCardDetailView.power)
                    }
                    HStack {
                        Text("Desfesa")
                        Text(magicCardDetailView.toughness)
                    }
                    HStack {
                        Text("Tipo")
                        Text(magicCardDetailView.type)
                    }
                }
            }
        }
    }
}

struct MagicCardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MagicCardDetailView(magicCardDetailView: MagicCardFormViewModel(UIImage(systemName: "photo")!))
    }
}

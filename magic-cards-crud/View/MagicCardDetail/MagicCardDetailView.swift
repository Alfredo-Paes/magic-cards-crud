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
            VStack(alignment: .leading) {
                Text(magicCardDetailView.name)
                    .font(.title)
                    .bold()
            }
            ScrollView {
                VStack {
                    Image(uiImage: magicCardDetailView.imageCard)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 335, height: 500)
                   
                    HStack {
                        Text("Descrição: ")
                            .font(.title2)
                            .bold()
                        Text(magicCardDetailView.text)
                    }.padding()
                     .padding(.bottom, 2)
                     .frame(maxWidth: .infinity, alignment: .leading)
                     .background(.white)
                     .cornerRadius(16)
                    HStack {
                        Text("Frase: ")
                            .font(.title2)
                            .bold()
                        Text(magicCardDetailView.flavor).italic()
                    }.padding()
                     .padding(.bottom, 2)
                     .frame(maxWidth: .infinity, alignment: .leading)
                     .background(.white)
                     .cornerRadius(16)
                    HStack {
                        Text("Custo de Mana: ")
                            .font(.title2)
                            .bold()
                        Text(magicCardDetailView.manaCost)
                    }.padding()
                     .padding(.bottom, 2)
                     .frame(maxWidth: .infinity, alignment: .leading)
                     .background(.white)
                     .cornerRadius(16)
                    HStack {
                        HStack {
                            Text("Poder: ")
                                .font(.title2)
                                .bold()
                            Text(magicCardDetailView.power)
                        }
                        Text("/").bold()
                        HStack {
                            Text("Defesa: ")
                                .font(.title2)
                                .bold()
                            Text(magicCardDetailView.toughness)
                        }
                    }.padding()
                     .padding(.bottom, 2)
                     .frame(maxWidth: .infinity, alignment: .leading)
                     .background(.white)
                     .cornerRadius(16)
                    HStack {
                        Text("Tipo: ")
                            .font(.title2)
                            .bold()
                        Text(magicCardDetailView.type)
                    }.padding()
                     .padding(.bottom, 2)
                     .frame(maxWidth: .infinity, alignment: .leading)
                     .background(.white)
                     .cornerRadius(16)
                }.padding()
            }.background(Color(uiColor: .systemGray6))
        }
    }
}

struct MagicCardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MagicCardDetailView(magicCardDetailView: MagicCardFormViewModel(UIImage(systemName: "photo")!))
    }
}

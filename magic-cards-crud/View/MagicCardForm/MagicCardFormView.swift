//
//  MagicCardFormView.swift
//  magic-cards-crud
//
//  Created by Alfredo Paes da Luz on 06/10/23.
//

import SwiftUI

struct MagicCardFormView: View {
    
    @ObservedObject var magicCardFormViewModel: MagicCardFormViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(uiImage: magicCardFormViewModel.imageCard)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 335, height: 230)
                    .padding()
                if magicCardFormViewModel.updating {
                    Button("Mudar Imagem") {
                        print("Mudar imagem")
                    }
                }
                ScrollView {
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
                    
                    Button(magicCardFormViewModel.updating ? "Editar" : "Cadastrar") {
                            print("Carta Cadastrada!")
                        }
                        .foregroundColor(.white)
                        .font(.title3)
                        .bold()
                        .frame(width: 335, height: 50)
                        .background(
                            magicCardFormViewModel.updating ? Color.purple : Color.green
                        )
                        .cornerRadius(12)
                }
                
            }
            .padding()
            .navigationTitle(
                magicCardFormViewModel.updating ? "Editar Carta" : "Nova Carta"
            )
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancelar")
                    }
                }
                if magicCardFormViewModel.updating {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            print("Deletar")
                        } label: {
                            Image(systemName: "trash.circle.fill")
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.red)
                    }
                }
            }
        }
    }
}

struct MagicCardFormView_Previews: PreviewProvider {
    static var previews: some View {
        MagicCardFormView(magicCardFormViewModel: MagicCardFormViewModel(UIImage(systemName: "photo")!))
    }
}

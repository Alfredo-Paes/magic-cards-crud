//
//  MagicCardFormView.swift
//  magic-cards-crud
//
//  Created by Alfredo Paes da Luz on 06/10/23.
//

import SwiftUI
import PhotosUI

struct MagicCardFormView: View {
    
    @ObservedObject var magicCardFormViewModel: MagicCardFormViewModel
    @StateObject var imagePicker = ImagePicker()
    @FetchRequest(sortDescriptors: [])
    private var magicCard: FetchedResults<MagicCard>
    @Environment(\.managedObjectContext) var moc
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
                    PhotosPicker("Mudar Imagem",
                                 selection: $imagePicker.imageSelection,
                                 matching: .images,
                                 photoLibrary: .shared()
                    )
                } 
                ScrollView {
                    TextField("Nome do Card", text: $magicCardFormViewModel.name)
                        .padding()
                        .frame(width: 335, height: 50)
                        .background(Color(uiColor: .systemGray6))
                        .cornerRadius(12)
                    TextField("Texto de Regra", text: $magicCardFormViewModel.text)
                        .padding()
                        .frame(width: 335, height: 50)
                        .background(Color(uiColor: .systemGray6))
                        .cornerRadius(12)
                    TextField("Texto Ilustrativo", text: $magicCardFormViewModel.flavor)
                        .padding()
                        .frame(width: 335, height: 50)
                        .background(Color(uiColor: .systemGray6))
                        .cornerRadius(12)
                    TextField("Cor de Mana", text: $magicCardFormViewModel.manaColor)
                        .padding()
                        .keyboardType(.decimalPad)
                        .frame(width: 335, height: 50)
                        .background(Color(uiColor: .systemGray6))
                    TextField("Custo de Mana", text: $magicCardFormViewModel.manaCost)
                        .padding()
                        .keyboardType(.decimalPad)
                        .frame(width: 335, height: 50)
                        .background(Color(uiColor: .systemGray6))
                        .cornerRadius(12)
                    TextField("Poder", text: $magicCardFormViewModel.power)
                        .padding()
                        .keyboardType(.decimalPad)
                        .frame(width: 335, height: 50)
                        .background(Color(uiColor: .systemGray6))
                        .cornerRadius(12)
                    TextField("Resistência", text: $magicCardFormViewModel.toughness)
                        .padding()
                        .keyboardType(.decimalPad)
                        .frame(width: 335, height: 50)
                        .background(Color(uiColor: .systemGray6))
                        .cornerRadius(12)
                    TextField("Tipo", text: $magicCardFormViewModel.type)
                        .padding()
                        .frame(width: 335, height: 50)
                        .background(Color(uiColor: .systemGray6))
                        .cornerRadius(12)

                    Button(magicCardFormViewModel.updating ? "Editar" : "Cadastrar") {
                        if magicCardFormViewModel.updating {
                            if let id = magicCardFormViewModel.id,
                               let selectedImage = magicCard.first(where: {$0.id == id}){
                                selectedImage.name = magicCardFormViewModel.name
                                selectedImage.text = magicCardFormViewModel.text
                                selectedImage.flavor = magicCardFormViewModel.flavor
                                selectedImage.manaCost = magicCardFormViewModel.manaCost
                                selectedImage.manaColor = magicCardFormViewModel.manaColor
                                selectedImage.power = magicCardFormViewModel.power
                                selectedImage.toughness = magicCardFormViewModel.toughness
                                selectedImage.type = magicCardFormViewModel.type
                                FileManager()
                                    .saveImage(with: id,
                                               image: magicCardFormViewModel.imageCard,
                                               name: magicCardFormViewModel.name
                                    )
                                if moc.hasChanges {
                                    try? moc.save()
                                }
                            }
                        } else {
                            let newMagicCard = MagicCard(context: moc)
                            newMagicCard.id = UUID().uuidString
                            newMagicCard.name = magicCardFormViewModel.name
                            newMagicCard.text = magicCardFormViewModel.text
                            newMagicCard.flavor = magicCardFormViewModel.flavor
                            newMagicCard.manaCost = magicCardFormViewModel.manaCost
                            newMagicCard.manaColor = magicCardFormViewModel.manaColor
                            newMagicCard.power = magicCardFormViewModel.power
                            newMagicCard.toughness = magicCardFormViewModel.toughness
                            newMagicCard.type = magicCardFormViewModel.type
                            try? moc.save()
                            FileManager()
                                .saveImage(with: newMagicCard.idCard,
                                           image: magicCardFormViewModel.imageCard,
                                           name: magicCardFormViewModel.name
                                )
                        }
                            dismiss()
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
                        Image(systemName: "chevron.backward")
                        Text("Voltar")
                    }
                }
                if magicCardFormViewModel.updating {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            if let selectedImage = magicCard.first(where: {$0.id == magicCardFormViewModel.id}) {
                                FileManager().deleteImage(with: selectedImage.idCard)
                                moc.delete(selectedImage)
                                try? moc.save()
                            }
                            dismiss()
                        } label: {
                            Image(systemName: "trash.circle.fill")
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.red)
                    }
                }
            } .onChange(of: imagePicker.uiImage) { newImage in
                if let newImage {
                    magicCardFormViewModel.imageCard = newImage
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

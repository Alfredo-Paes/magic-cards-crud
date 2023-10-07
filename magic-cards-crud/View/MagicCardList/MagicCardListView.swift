//
//  ContentView.swift
//  magic-cards-crud
//
//  Created by Alfredo Paes da Luz on 05/10/23.
//

import SwiftUI
import CoreData
import PhotosUI

struct MagicCardListView: View {
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)])
    private var magicCard: FetchedResults<MagicCard>
    @StateObject private var imagePicker = ImagePicker()
    @State private var magicCardFormType: MagicCardFormType?
    
    var body: some View {
        NavigationStack {
            VStack {
                if !magicCard.isEmpty {
                    ScrollView {
                        ForEach(magicCard) { MyCard in
                            VStack {
                                Button {
                                    magicCardFormType = .update(MyCard)
                                } label: {
                                    HStack {
                                        Image(uiImage: MyCard.imageCard)
                                            .resizable()
                                            .font(.largeTitle)
                                            .bold()
                                            .symbolRenderingMode(.monochrome)
                                            .scaledToFit()
                                            .frame(width: 50, height: 50)
                                        VStack(alignment: .leading) {
                                            Text(MyCard.nameCard)
                                                .font(.title2)
                                                .bold()
                                            Text(MyCard.typeCard)
                                        }
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(.white)
                                    .cornerRadius(16)
                                }
                            }.padding()
                        }
                    }.background(Color(uiColor: .systemGray6))
                } else {
                    VStack(alignment: .center, spacing: 16) {
                        Text("Não há cartas registradas")
                            .font(.title)
                            .foregroundColor(.gray)
                        Text("Clique em Nova Carta, selecione uma imagem e preencha o formulário com as informações dela.")
                            .foregroundColor(.white)
                            .font(.subheadline)
                            .bold()
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.indigo)
                        PhotosPicker("Nova Carta",
                                     selection: $imagePicker.imageSelection ,
                                     matching: .images,
                                     photoLibrary: .shared()
                        )
                        .foregroundColor(.white)
                        .font(.title3)
                        .bold()
                        .frame(width: 335, height: 50)
                        .background(Color.green)
                        .cornerRadius(12)
                    }
                }
                
            }
            .navigationTitle("Meu Deck de Magic")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Configurações"){
                        print("Nova Carta")
                    }
                }
                if !magicCard.isEmpty {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        PhotosPicker("Nova Carta",
                                     selection: $imagePicker.imageSelection ,
                                     matching: .images , photoLibrary: .shared())
                    }
                }
            }
            .onChange(of: imagePicker.uiImage) { newImage in
                if let newImage {
                    print(newImage)
                    magicCardFormType = .new(newImage)
                }
            }
            .sheet(item: $magicCardFormType) { $0 }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MagicCardListView()
    }
}

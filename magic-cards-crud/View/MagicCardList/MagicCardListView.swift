//
//  ContentView.swift
//  magic-cards-crud
//
//  Created by Alfredo Paes da Luz on 05/10/23.
//

import SwiftUI
import CoreData

struct MagicCardListView: View {

    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    HStack {
                        Image(systemName: "photo")
                            .resizable()
                            .font(.largeTitle)
                            .bold()
                            .symbolRenderingMode(.monochrome)
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                        VStack(alignment: .leading) {
                            Text("Carta")
                                .font(.title2)
                                .bold()
                            Text("Fogo")
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.white)
                    .cornerRadius(16)
                    HStack {
                        Image(systemName: "photo")
                            .resizable()
                            .font(.largeTitle)
                            .bold()
                            .symbolRenderingMode(.monochrome)
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                        VStack(alignment: .leading) {
                            Text("Carta")
                                .font(.title2)
                                .bold()
                            Text("Fogo")
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.white)
                    .cornerRadius(16)
                    HStack {
                        Image(systemName: "photo")
                            .resizable()
                            .font(.largeTitle)
                            .bold()
                            .symbolRenderingMode(.monochrome)
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                        VStack(alignment: .leading) {
                            Text("Carta")
                                .font(.title2)
                                .bold()
                            Text("Fogo")
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.white)
                    .cornerRadius(16)
                    HStack {
                        Image(systemName: "photo")
                            .resizable()
                            .font(.largeTitle)
                            .bold()
                            .symbolRenderingMode(.monochrome)
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                        VStack(alignment: .leading) {
                            Text("Carta")
                                .font(.title2)
                                .bold()
                            Text("Fogo")
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.white)
                    .cornerRadius(16)
                }.padding()
            }.background(Color(uiColor: .systemGray6))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MagicCardListView()
    }
}

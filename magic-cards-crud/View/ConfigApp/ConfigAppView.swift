//
//  ConfigAppView.swift
//  magic-cards-crud
//
//  Created by Alfredo Paes da Luz on 07/10/23.
//

import SwiftUI

struct ConfigAppView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Configurações")
                    .font(.title2)
                    .bold()) {
                    NavigationLink(destination: InfoAppView()) {
                        Text("Sobre")
                        Image(systemName: "info.circle")
                    }
                }
            }
        }
    }
}

struct ConfigAppView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigAppView()
    }
}

//
//  InfoAppView.swift
//  magic-cards-crud
//
//  Created by Alfredo Paes da Luz on 08/10/23.
//

import SwiftUI

struct InfoAppView: View {
    let github = "[github.com/Alfredo-Paes](https://github.com/Alfredo-Paes)"
    let linkedin = "[Likedin](https://www.linkedin.com/in/alfredo-paes-developer/)"
    let repository = "[Link do repositório](https://github.com/Alfredo-Paes/magic-cards-crud)."
    let infoMagic = "Para maiores inforamações sobre o jogo de cartas Magic: The Gathering acesse: [Magic Wizards](https://magic.wizards.com/pt-BR)."
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Text("Meu Deck de Magic")
                .font(.largeTitle)
            Text("Essa aplicação possui a finalidade de permitir ao usúario poder cadastrar a suas cartas do jogo Magic: The Gathering. Nessa aplicação, o usuário pode registrar, editar, listar e reomver as cartas de seu deck(grimório).")
                .font(.title3)
                .padding()
            Text(.init(infoMagic))
                .font(.title3)
                .padding()
            
            Text("Desenvolvido por Alfredo Paes da Luz")
                .font(.title2)
                .foregroundColor(.gray)
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Image(systemName: "globe")
                    Text(.init(github))
                }
                HStack {
                    Image(systemName: "globe")
                    Text(.init(linkedin))
                }
                HStack {
                    Image(systemName: "globe")
                    Text(.init(repository))
                }
            }
            
        }
    }
}

struct InfoAppView_Previews: PreviewProvider {
    static var previews: some View {
        InfoAppView()
    }
}

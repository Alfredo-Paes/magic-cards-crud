//
//  DeleteAllView.swift
//  magic-cards-crud
//
//  Created by Alfredo Paes da Luz on 08/10/23.
//
import CoreData
import SwiftUI

struct DeleteAllView: View {
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MagicCard")

    @FetchRequest(sortDescriptors: [])
    private var magicCard: FetchedResults<MagicCard>
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var showAlert = false

    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("Remover todos os cards")
                .font(.largeTitle)
                .padding()
            Text("Essa ação irá remover todos os cards de Magic já registrados.")
                .font(.title3)
                .padding()
            Button {
                showAlert = true
            } label: {
                Text("Apagar Tudo").bold()
                Image(systemName: "trash")
            }.foregroundColor(.white)
                .font(.title3)
                .bold()
                .frame(width: 335, height: 50)
                .background(Color.red)
                .cornerRadius(12)
                .alert("Muita Atenção!",
                       isPresented: $showAlert
                ) {
                    Button("Sim") {
                        deleteAll()
                    }
                    Button("Não", role: .cancel) {}
                } message: {
                    Text("Essa é uma ação sem retonro. Ao apagar os dados, todas as informações serão peridas. Você concorda com isso? ")
                }
        }
    }
    
    func deleteAll() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MagicCard")
        let items = try? moc.fetch(fetchRequest)
        for item in items ?? [] {
            moc.delete(item as! NSManagedObject)
        }
        try? moc.save()
        dismiss()
    }
}

struct DeleteAllCardsView_Previews: PreviewProvider {
    static var previews: some View {
        DeleteAllView()
    }
}

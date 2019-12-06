//
//  NumberOfPlayersSelection.swift
//  MeplesShuffler
//
//  Created by Angel Esteban González Fuentes on 03/12/2019.
//  Copyright © 2019 Angel Gonzalez Fuentes. All rights reserved.
//

import SwiftUI

struct NumberOfPlayersSelection: View {
    @EnvironmentObject var meplesList: MeplesList
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        NavigationView{
            List(self.meplesList.baseList){meple in
                MultiSelectRow(meple: meple)
            }
            .navigationBarTitle("Players \(self.meplesList.countSelectedList())", displayMode: .inline)
            .navigationBarItems(trailing: Button("Done"){
                self.presentationMode.wrappedValue.dismiss()
            })
        }
    }
}
#if DEBUG
struct NumberOfPlayersSelection_Previews: PreviewProvider {
    static let meplesList = MeplesList()
    static var previews: some View {
        NumberOfPlayersSelection().environmentObject(meplesList)
    }
}
#endif

//
//  NumberOfPlayersSelection.swift
//  MeplesShuffler
//
//  Created by Angel Esteban González Fuentes on 03/12/2019.
//  Copyright © 2019 Angel Gonzalez Fuentes. All rights reserved.
//

import SwiftUI

struct MultiSelectRow: View{
    var meple: Meple
    @EnvironmentObject var meplesList: MeplesList
    
    var isSelected: Bool {
        return !meplesList.selectedList.filter{$0.id == self.meple.id}.isEmpty
    }
    var body: some View{
        HStack{
            Text(meple.name)
            Spacer()
            if self.isSelected{
                Image(systemName: "checkmark")
                    .foregroundColor(.blue)
            }
        }
        .onTapGesture {
            print("click")
            if self.isSelected{
                self.meplesList.selectedList = self.meplesList.selectedList.filter{
                    $0.id != self.meple.id
                }
            } else{
                self.meplesList.selectedList.append(self.meple)
            }
        }
    }
}

struct NumberOfPlayersSelection: View {
    @EnvironmentObject var meplesList: MeplesList
    var body: some View {
        NavigationView{
            List(self.meplesList.baseList){meple in
                MultiSelectRow(meple: meple)
            }
            .navigationBarTitle("Selected \(self.meplesList.countSelectedList())")
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

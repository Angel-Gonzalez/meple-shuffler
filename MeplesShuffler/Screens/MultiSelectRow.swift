//
//  MultiSelectRow.swift
//  MeplesShuffler
//
//  Created by Angel Esteban González Fuentes on 05/12/2019.
//  Copyright © 2019 Angel Gonzalez Fuentes. All rights reserved.
//

import SwiftUI

struct MultiSelectRow: View {
   var meple: Meple
    @EnvironmentObject var meplesList: MeplesList
    
    var isSelected: Bool {
        return !meplesList.selectedList.filter{$0.id == self.meple.id}.isEmpty
    }
    var body: some View{
        HStack{
            Text(meple.name)
                .bold()
            Spacer()
            if self.isSelected{
                Image(systemName: "checkmark")
                    .foregroundColor(.blue)
            }
        }
        .padding()
        .overlay(Capsule()
        .stroke(self.meple.color, lineWidth: 3))
        .onTapGesture {
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

struct MultiSelectRow_Previews: PreviewProvider {
    static let meplesList = MeplesList()
    static let meple = Meple(color: .blue, name: "dummy")
    static var previews: some View {
        MultiSelectRow(meple: meple).environmentObject(meplesList)
    }
}

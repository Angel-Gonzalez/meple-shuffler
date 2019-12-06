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
    var gradient: LinearGradient{
        LinearGradient(
            gradient: Gradient(colors: [self.meple.color, self.meple.color.opacity(0.9)]),
            startPoint: .leading, endPoint: .trailing)
    }
    var body: some View{
        ZStack{
            Rectangle().fill(gradient).cornerRadius(20)
            HStack{
                Text(meple.name)
                    .bold()
                    .foregroundColor(.white)
                Spacer()
                if self.isSelected{
                    Image(systemName: "checkmark")
                        .foregroundColor(.white)
                }
            }
            .padding()
            .cornerRadius(20)
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
}

struct MultiSelectRow_Previews: PreviewProvider {
    static let meplesList = MeplesList()
    static let meple = Meple(color: .blue, name: "dummy")
    static var previews: some View {
        MultiSelectRow(meple: meple).environmentObject(meplesList)
    }
}

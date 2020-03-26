//
//  MepleRow.swift
//  MeplesShuffler
//
//  Created by Angel Esteban González Fuentes on 05/12/2019.
//  Copyright © 2019 Angel Gonzalez Fuentes. All rights reserved.
//

import SwiftUI

struct MepleRow: View {
    var meple: Meple
    @EnvironmentObject var meplesList: MeplesList
    
    var isSelected: Bool {
        return !meplesList.selectedList.filter{$0.id == self.meple.id}.isEmpty
    }
    var gradient: LinearGradient{
        LinearGradient(
            gradient: Gradient(colors: [self.meple.color, self.meple.color.opacity(0.8)]),
            startPoint: .leading, endPoint: .trailing)
    }
    var body: some View{
        HStack{
            Image("white-mepple").resizable()
            .frame(width: 40, height: 40)
            Spacer()
            Text("\(meple.score)")
                .bold()
                .foregroundColor(.white)
        }
        .padding()
        .background(Rectangle().fill(gradient).cornerRadius(20))
        .cornerRadius(20)
    }
    
}
struct MepleRow_Previews: PreviewProvider {
    static let meplesList = MeplesList()
    static let meple = Meple(color: .blue, name: "dummy")
    static var previews: some View {
        MepleRow(meple: meple).environmentObject(meplesList)
    }
}

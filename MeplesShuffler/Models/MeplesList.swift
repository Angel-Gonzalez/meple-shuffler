//
//  MeplesList.swift
//  MeplesShuffler
//
//  Created by Angel Esteban González Fuentes on 04/12/2019.
//  Copyright © 2019 Angel Gonzalez Fuentes. All rights reserved.
//

import SwiftUI

class MeplesList: ObservableObject {
    @Published var baseList = [
        Meple(color: .red,name: "red"),
        Meple(color: .green, name: "green"),
        Meple(color: .blue, name: "blue"),
        Meple(color: .orange, name: "orange"),
        Meple(color: .gray, name: "gray"),
        Meple(color: .purple, name: "purple"),
        Meple(color: .pink, name: "pink"),
        Meple(color: .yellow , name: "yellow")
    ]
    
    @Published var selectedList = [Meple]()
    
    func countSelectedList() -> Int{
        return self.selectedList.count
    }
}

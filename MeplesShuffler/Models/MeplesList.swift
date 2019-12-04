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
        Meple(color: Color(red:255,green:0,blue:0), name: "red"),
        Meple(color: Color(red:0,green:255,blue:0), name: "green"),
        Meple(color: Color(red:0,green:0,blue:255), name: "blue"),
        Meple(color: Color(red:0,green:0,blue:0), name: "black"),
        Meple(color: Color(red:255,green:255,blue:255), name: "white")
    ]
    
    @Published var selectedList = [Meple]()
    
    func countSelectedList() -> Int{
        return self.selectedList.count
    }
}

//
//  Meple.swift
//  MeplesShuffler
//
//  Created by Angel Esteban González Fuentes on 03/12/2019.
//  Copyright © 2019 Angel Gonzalez Fuentes. All rights reserved.
//

import SwiftUI

struct Meple: Identifiable, Hashable {
    let id: UUID = UUID()
    let color: Color
    let name: String
    var score: Int = 0
}

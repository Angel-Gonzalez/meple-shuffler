//
//  Dice.swift
//  MeplesShuffler
//
//  Created by Angel Esteban González Fuentes on 11/12/2019.
//  Copyright © 2019 Angel Gonzalez Fuentes. All rights reserved.
//

import SwiftUI

struct Dice: Identifiable {
    let id = UUID()
    let sides: Int
    var times: Int = 0
    let image: Image
}

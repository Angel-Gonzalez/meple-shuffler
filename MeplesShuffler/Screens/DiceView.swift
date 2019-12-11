//
//  DiceView.swift
//  MeplesShuffler
//
//  Created by Angel Esteban González Fuentes on 11/12/2019.
//  Copyright © 2019 Angel Gonzalez Fuentes. All rights reserved.
//

import SwiftUI

struct DiceView: View {
    
    @State var fourSides:Dice = Dice(sides:4, image: Image(systemName: "triangle.fill"))
    @State var sixSides:Dice = Dice(sides:6, image: Image(systemName: "triangle.fill"))
    @State var eightSides:Dice = Dice(sides:8, image: Image(systemName: "triangle.fill"))
    @State var twelveSides:Dice = Dice(sides:12, image: Image(systemName: "triangle.fill"))
    @State var twentySides:Dice = Dice(sides:20, image: Image(systemName: "triangle.fill"))
    @State var houndredSides:Dice = Dice(sides:100, image: Image(systemName: "hexagon.fill"))
    @State var total: Int = 0
    
    var body: some View {
        VStack{
            HStack{
                Button(action:{
                    self.fourSides.times += 1
                }){
                    VStack{
                        self.fourSides.image
                        Text("D4 x \(self.fourSides.times)")
                    }
                }
                .padding()
                Button(action:{
                    self.sixSides.times += 1
                }){
                    VStack{
                        self.sixSides.image
                        Text("D6 x \(self.sixSides.times)")
                    }
                }
                .padding()
                Button(action:{
                    self.eightSides.times += 1
                }){
                    VStack{
                        self.eightSides.image
                        Text("D8 x \(self.eightSides.times)")
                    }
                }
                .padding()
            }
            HStack{
                Button(action:{
                    self.twelveSides.times += 1
                }){
                    VStack{
                        self.twelveSides.image
                        Text("D12 x \(self.twelveSides.times)")
                    }
                }
                .padding()
                Button(action:{
                    self.twentySides.times += 1
                }){
                    VStack{
                        self.twentySides.image
                        Text("D20 x \(self.twentySides.times)")
                    }
                }
                .padding()
                Button(action:{
                    self.houndredSides.times += 1
                }){
                    VStack{
                        self.houndredSides.image
                        Text("D100 x \(self.houndredSides.times)")
                    }
                }
                .padding()
            }
            Spacer()
            Text("Results : \(total)")
                .padding()
            Button(action:{
                self.fourSides.times = 0
                self.sixSides.times = 0
                self.eightSides.times = 0
                self.twelveSides.times = 0
                self.twentySides.times = 0
                self.houndredSides.times = 0
                self.total = 0
            }){
                HStack{
                    Image(systemName: "clear")
                    Text("Clear results")
                }
            }
            .padding()
            Button(action: {
                self.total = 0
                if(self.fourSides.times > 0){
                    for _ in 1 ... self.fourSides.times{
                        self.total += self.getRandom(dice: self.fourSides)
                    }
                }
                if(self.sixSides.times > 0){
                    for _ in 1 ... self.sixSides.times{
                        self.total += self.getRandom(dice: self.sixSides)
                    }
                }
                if(self.eightSides.times > 0){
                    for _ in 1 ... self.eightSides.times{
                        self.total += self.getRandom(dice: self.eightSides)
                    }
                }
                if(self.twelveSides.times > 0){
                    for _ in 1 ... self.twelveSides.times{
                        self.total += self.getRandom(dice: self.twelveSides)
                    }
                }
                if(self.twentySides.times > 0){
                    for _ in 1 ... self.twentySides.times{
                        self.total += self.getRandom(dice: self.twentySides)
                    }
                }
                if(self.houndredSides.times > 0){
                    for _ in 1 ... self.houndredSides.times{
                        self.total += self.getRandom(dice: self.houndredSides)
                    }
                }
            }){
                HStack{
                    Image(systemName: "shuffle")
                    Text("shuffleButton")
                }
            }
            .padding()
        }
    }
    
    func getRandom(dice: Dice) -> Int{
        return Int.random(in: 1 ... dice.sides)
    }
}

struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView()
    }
}

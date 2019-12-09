//
//  ContentView.swift
//  MeplesShuffler
//
//  Created by Angel Esteban González Fuentes on 03/12/2019.
//  Copyright © 2019 Angel Gonzalez Fuentes. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var meplesList: MeplesList
    @State var playerSelectorIsShown = false
    var body: some View {
        NavigationView{
            VStack{
                List(meplesList.selectedList){meple in
                    MepleRow(meple: meple)
                }
                
                Button(action:{
                    self.shuffle()
                }){
                    HStack{
                        Image(systemName: "shuffle")
                        Text("shuffleButton")
                    }
                }
                .padding(20)
            }
            .navigationBarTitle(Text("appName"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action:{
                self.playerSelectorIsShown.toggle()
            }){
                Image(systemName: "person.3.fill")
            }
            .padding()
            .sheet(isPresented: self.$playerSelectorIsShown){ NumberOfPlayersSelection().environmentObject(self.meplesList)
            })
        }
    }
    func shuffle(){
        self.meplesList.selectedList = self.meplesList.selectedList.shuffled()
    }
}

struct ContentView_Previews: PreviewProvider {
    static let meplesList = MeplesList()
    static var previews: some View {
        ContentView().environmentObject(meplesList)
    }
}

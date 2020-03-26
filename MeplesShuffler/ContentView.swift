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
            TabView{
                VStack{
                    List(meplesList.selectedList){meple in
                        MepleRow(meple: meple)
                    }
                    Button(action:{
                        self.playerSelectorIsShown.toggle()
                    }){
                        HStack{
                            Image(systemName: "person.3.fill")
                            Text("Players")
                        }
                    }
                    .padding()
                    .sheet(isPresented: self.$playerSelectorIsShown){ NumberOfPlayersSelection().environmentObject(self.meplesList)
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
                .tabItem({
                    Image(systemName: "person")
                    Text("mepleNavigationButton")
                    })
                DiceView()
                    .tabItem({
                        Image(systemName: "hexagon")
                        Text("dicesNavigationButton")
                    })
            }
            .navigationBarTitle(Text("appName"), displayMode: .inline)
        }
        .onAppear(){
            self.meplesList.selectedList = [
                self.meplesList.baseList[0],
                self.meplesList.baseList[3],
                self.meplesList.baseList[4],
                self.meplesList.baseList[5]
            ]
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

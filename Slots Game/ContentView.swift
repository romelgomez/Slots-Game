//
//  ContentView.swift
//  Slots Game
//
//  Created by romel javier gomez herrera on 10/03/24.
//

import SwiftUI

struct ContentView: View {
        
    let win = 500
    let lose = 50
    
    @State var credits = 1000
    @State var optionA = Int.random(in: 0...2)
    @State var optionB = Int.random(in: 0...2)
    @State var optionC = Int.random(in: 0...2)
    @State var options = ["apple", "cherry", "star"]
    
    func random () {
        optionA = Int.random(in: 0...2)
        optionB = Int.random(in: 0...2)
        optionC = Int.random(in: 0...2)
    }
    
    func spin () {
        random()
        
        let isWinner = optionA == optionB && optionB == optionC
       
        if (isWinner) {
            credits += win
            
            return
        }
        
        let lestThanZero = credits - lose
       
        if (lestThanZero < 0) {
            credits = 0
        } else {
            credits -= lose
        }
    }
    
    var body: some View {
                
        Text("SwiftUI Slots!")
            .bold()
            .foregroundStyle(.cyan)
            .font(.title)
        
        Spacer()
        
        HStack() {
            Text("Credits: " + String(credits))
        }
        
        Spacer()
        
        HStack(){
            Image(options[optionA])
                   .resizable()
                   .scaledToFit()
               Image(options[optionB])
                   .resizable()
                   .scaledToFit()
               Image(options[optionC])
                   .resizable()
                   .scaledToFit()
        }
        
        Spacer()
        
        Button(action: {
            spin()
        }) {
            Text("Spin")
                .frame(minWidth: 0, maxWidth: .infinity)
                .foregroundColor(.white)
                .padding()
                .background(credits > 0 ? Color.red : Color.gray)
                .cornerRadius(25)
                .padding(.horizontal, 16)
                .frame(width: 150, height: 50)
        }
        .disabled(credits <= 0)

    }
}

#Preview {
    ContentView()
}

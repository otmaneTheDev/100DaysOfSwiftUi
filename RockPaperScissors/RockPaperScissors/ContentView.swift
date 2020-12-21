//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by El Ati El Adimi, Othmane on 21/12/2020.
//  Copyright © 2020 El Ati El Adimi, Othmane. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let options = ["","rock", "paper","scissors"]
    
    @State private var selectedOption = 0
    @State private var currentScore = 0

    @State private var userSelectedOption = 0
    @State private var showingAlert = false
    
    @State private var alertTitle = ""
    
    var body: some View {
        VStack(spacing: 20){
            HStack{
                Text("Score \(currentScore)").frame(maxWidth: .infinity, alignment: .center)
            }
            
            Picker("Option", selection: $userSelectedOption) {
                ForEach(1 ..< options.count) {
                    Text("\(self.options[$0])")
                }
            }.pickerStyle(SegmentedPickerStyle())
            
            Text("\(options[selectedOption])")

            Button(action: {
                self.selectedOption = Int.random(in: 1...(self.options.count - 1))
                self.checkWinner()
            }){
                Text("Play")
            }
            .padding([[.horizontal]],20)
            .padding(.vertical,5)
            .background(Color.blue)
            .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
            
        }
        .padding()
        .alert(isPresented: $showingAlert) {
            Alert(
                title: Text(alertTitle),
                message: Text("Press the button to play again"),
                dismissButton: .default(Text("Play again")) {
                    self.userSelectedOption = 0
                    self.selectedOption = 0
                    self.currentScore = 0
                    self.alertTitle = ""
                }
            )
        }
    }
    
    func checkWinner(){
        print("UserSelectedOption : \(userSelectedOption)")
        print("selectedOption : \(selectedOption)")
        
        if(userSelectedOption == selectedOption){
            currentScore += 1
        }else{
            currentScore -= 1
        }
        
        if(currentScore == 10){
            self.showingAlert = true
            self.alertTitle = "You won"
        }
        
        if(currentScore == -10){
            self.showingAlert = true
            self.alertTitle = "You lost"
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

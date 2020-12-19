//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by El Ati El Adimi, Othmane on 18/12/2020.
//  Copyright © 2020 El Ati El Adimi, Othmane. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia","France","Germany","Ireland","Italy","Nigeria","Poland","Russia","Spain","UK","US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScoreAlert = false
    @State private var correctFlagMessage = ""
    @State private var scorePuntuation = 0
    @State private var scoreTitle = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue,.black]), startPoint: .top, endPoint: UnitPoint.bottom).edgesIgnoringSafeArea(.all)
            
            VStack{
                VStack{
                    Text("Tap the flag of").foregroundColor(.white).fixedSize()
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.headline)
                        .fontWeight(.black)
                        .fixedSize()
                }
                
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        self.flagTapped(number)
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.black,lineWidth: 1))
                            .shadow(color: .black, radius: 2)
                    }
                }
                
                Text("Score \(scorePuntuation)")
                    .foregroundColor(.white)
                    .font(.headline)
                    .fontWeight(.black)
            }
        }
        .alert(isPresented: $showingScoreAlert) {
            Alert(
                title: Text(scoreTitle),
                message: Text(correctFlagMessage),
                dismissButton: .default(Text("Continue")) {
                    self.askQuestion()
                }
            )
        }
    }
    
    func flagTapped(_ number : Int){
        if(number == correctAnswer){
            scorePuntuation += 1
            scoreTitle = "Correct"
            correctFlagMessage = ""
        } else {
            scoreTitle = "Wrong"
            correctFlagMessage = "Wrong! That's the flag of \(countries[number])"
        }
        
        showingScoreAlert = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

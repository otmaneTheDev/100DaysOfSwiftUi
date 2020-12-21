//
//  ContentView.swift
//  CustomViews
//
//  Created by El Ati El Adimi, Othmane on 21/12/2020.
//  Copyright © 2020 El Ati El Adimi, Othmane. All rights reserved.
//

import SwiftUI

struct RoundedText :View {
    var text : String
    
    var body : some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(Capsule())
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct BlueTitle : ViewModifier {
    func body(content:Content)-> some View {
        content.font(.largeTitle).foregroundColor(.blue)
    }
}

struct Flag : View {
    var imageName: String
    
    var body : some View {
        
        Image(systemName : imageName)
            .padding(50)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black,lineWidth: 1))
            .shadow(color: .black, radius: 5)
            .padding(50)
    }
}

extension View {
    func setBlueTitle() -> some View {
        self.modifier(BlueTitle())
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}

struct ContentView: View {
    @State private var useRedText = false
    let titleText = Text("Lorem rick sum!!")
    
    let percentages = [10, 15, 20, 25, 0]
    @State private var tipPercentage = 2
    
    var body: some View {
        VStack(spacing : 10) {
            Button("Tap to change color") {
                self.useRedText.toggle()
            }
            .padding(20)
            .background(useRedText ? Color.red : Color.blue)
            .foregroundColor(.black)
            
            VStack {
                Text("Gryffindor")
                    .font(.largeTitle)
                Text("Hufflepuff")
                Text("Ravenclaw")
                Text("Slytherin")
            }
            .font(.title)
            
            titleText
            
            RoundedText(text : "My name")
            
            Text("Custom modifier").modifier(Title())
            
            Text("Custom modifier style").titleStyle()
            
            Text("Challenge text").setBlueTitle()
            
            Picker("Tip percentage", selection: $tipPercentage) {
                ForEach(0 ..< percentages.count) {
                    Text("\(self.percentages[$0]) %")
                }
            }.pickerStyle(SegmentedPickerStyle())
            
            Text("Amount \(percentages[tipPercentage])").foregroundColor(percentages[tipPercentage] == 0 ? .red : .blue)
            
            Flag(imageName: "heart.fill")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

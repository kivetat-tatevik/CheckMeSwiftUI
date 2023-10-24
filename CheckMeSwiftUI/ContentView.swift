//
//  ContentView.swift
//  CheckMeSwiftUI
//
//  Created by Tatevik Khunoyan on 24.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentValue = Double.random(in: 0...100)
    @State private var showAlert = false
    
    @State private var targetValue = Double.random(in: 0...100)
    
    var body: some View {
        VStack(spacing: 20) {

            HStack {
                Text("Подвиньте слайдер, как можно ближе к:")
                    .font(.callout)
                
                Spacer()
                
                Text("\(lround(targetValue))")
                    .font(.callout)
            }
            
            UISliderRepresentation(value: $currentValue)
            
            VStack(spacing: 20) {
                Button("Проверь меня!") {
                    showAlert = true
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Your Score"),
                        message: Text("\(computeScore())")
                    )
                }
                
                Button("Начать заново") {
                    restart()
                }
            }
        }
        .padding()
    }
    
    private func computeScore() -> Int {
        let difference = abs(lround(targetValue - currentValue))
        return 100 - difference
    }
    
    private func restart() {
        targetValue = Double.random(in: 0...100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//
//  mindfulView.swift
//  InnerZenApp Watch App
//
//  Created by Reaenn Wiebers on 10/27/23.
// This is the mindful view where the user can take a short quiz
// store the data, and the have it to look back on

import SwiftUI

struct mindfulView: View {

    @State var timeRemaining = 60
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var words = ["Peace", "Acceptance", "Confidence","Zen","Dead Bird","Gratitude"]
    
    @State private var currentWord = "Focus Word"
    
    @FocusState private var isFocused: Bool
    @State private var text = "What is your mood?"
    
    
    func start(){
        timeRemaining = 60
    }
    
    //updating words for random focus word
    func updateCurrentWord() {
        let randomIndex = Int.random(in: 0..<words.count)
        currentWord = words[randomIndex]
    }
                
    var body: some View {
        //this is the mood label
        HStack{
            Image(systemName:"theatermasks")
                .foregroundColor(Color.theme.accent);
            Text("Mood")
        }
        //this is the mood text field
        HStack{
            
            TextField(text: $text) {
            }.focused($isFocused)
            
        }
        //this the focus word section where you tap on the word and it generates a random word to focus on during your mindful moment
        HStack{
            Image("MindfulMomentIcon")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(Color.theme.accent);
            Text("Word:")
            Text(currentWord)
                .foregroundColor(Color.theme.accent2)
                .onTapGesture {
                    updateCurrentWord()
                }
        }
            
            //timer for mindful moment
            Button(action: start){
                Text("\(timeRemaining)")
                    .onReceive(timer) { _ in
                        if timeRemaining > 0 {
                            timeRemaining -= 1
                        }
                    }
            }
        
    }
}

#Preview {
    mindfulView()
}

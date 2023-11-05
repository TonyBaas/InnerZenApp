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
        
        Label("Mood", systemImage: "theatermasks")
        HStack{
            
            TextField(text: $text) {
                Text("Tap, touch and hold, or swipe left to rename")
            }.focused($isFocused)
            
        }
        HStack{
            Label("Word:", systemImage: "brain");                    Text(currentWord)
                .onTapGesture {
                    updateCurrentWord()
                }
            Label("", systemImage: "")
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

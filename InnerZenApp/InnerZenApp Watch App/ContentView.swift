//
//  ContentView.swift
//  InnerZenApp Watch App
//
//  Created by Tony Baas, Reaenn Wiebers, Rohan Basnet on 10/19/23.
//  This is our InnerZen app which is just an app to get back
//  in touch with yourself
//

import SwiftUI


struct ContentView: View {
    // This creates an arry with quotes in it
    @State private var quotes = ["Everything is Fine.", "Keep it off campus guys.", "Read the writing on the wall."]
    
    // This sets shuffling to true
    @State private var isShuffling = true
    
    // This holds the random choosen qoute
    @State private var currentQuote = "Random Quote"
    
    var body: some View {
        
        NavigationView {
            VStack{
                // App name
                HStack{
                    Text("InnerZen                              ")
                        .font(.system(size: 20))
                        .bold()
                        .foregroundColor(Color.theme.accent)
                }
                
                // Random Qoute
                NavigationLink(destination: EmptyView()) {
                    Text(currentQuote)
                        .onTapGesture {
                            updateCurrentQuote()
                        }
                        .font(.system(size: 13.5))
                        .bold()
                        .foregroundColor(Color.theme.accent2)
                }
                
                // Goes to the mindfulView
                NavigationLink(destination: mindfulView()) {
                    HStack{
                        Image("MindfulMomentIcon")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("          Mindful Moment")
                            .font(.system(size: 13.5))
                            .bold()
                    }
                }
                
                //Goes to the breathView
                NavigationLink(destination: breathView()) {
                    HStack{
                        Image("BreathIcon")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("                 Take a breath")
                            .font(.system(size: 13.5))
                            .bold()
                    }
                    
                }
            }
        }
        .onAppear {
            updateCurrentQuote() // Initial quote
            startQuoteTimer()
        }
    }
    
    // This uodates the qoute every 10 secounds
    func updateCurrentQuote() {
        let randomIndex = Int.random(in: 0..<quotes.count)
        currentQuote = quotes[randomIndex]
    }

    // This changes the qoute every 10 secounds
    func startQuoteTimer() {
        Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { _ in
            updateCurrentQuote()
        }
    }
}

#Preview {
    ContentView()
}

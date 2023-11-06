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
    
    @State private var quotes = ["Everything is Fine.", "Keep it off campus guys.", "Read the writing on the wall."]
    @State private var isShuffling = true
    
    @State private var currentQuote = "Random Quote"
    
    var body: some View {
        
        NavigationView {
            VStack{
                HStack{
                    Text("InnerZen                              ")
                        .font(.system(size: 20))
                        .bold()
                        .foregroundColor(Color.theme.accent)
                }
                NavigationLink(destination: EmptyView()) {
                    Text(currentQuote)
                        .onTapGesture {
                            updateCurrentQuote()
                        }
                        .font(.system(size: 13.5))
                        .bold()
                }
                NavigationLink(destination: mindfulView()) {
                    VStack{
                        Text("Mindful Moment")
                            .font(.system(size: 13.5))
                            .bold()
                    }
                }
                NavigationLink(destination: breathView()) {
                    Text("Take a breath")
                        .font(.system(size: 13.5))
                        .bold()
                }
            }
        }
        .onAppear {
            updateCurrentQuote() // Initial quote
            startQuoteTimer()
        }
    }
    
    func updateCurrentQuote() {
        let randomIndex = Int.random(in: 0..<quotes.count)
        currentQuote = quotes[randomIndex]
    }

    func startQuoteTimer() {
        Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { _ in
            updateCurrentQuote() // Update the quote every 10 seconds
        }
    }
}




#Preview {
    ContentView()
}

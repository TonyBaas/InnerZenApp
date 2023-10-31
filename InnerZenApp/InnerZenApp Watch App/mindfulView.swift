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
                    
    var body: some View {
        Label("Mood", systemImage: "theatermasks")
        Label("Word", systemImage: "brain")
        Label("", systemImage: "")
        Text("\(timeRemaining)")
            .onReceive(timer) { _ in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                }
            }
    }
}

#Preview {
    mindfulView()
}

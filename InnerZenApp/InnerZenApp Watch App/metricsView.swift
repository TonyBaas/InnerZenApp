//
//  metricsView.swift
//  InnerZenApp Watch App
//
//  Created by Rohan Basnet on 11/7/23.
//  Shows the timer and heart rate for the app

import SwiftUI

struct metricsView: View {
    @Binding var isTimerRunning: Bool
    @Binding var timeRemaining: Int
    @State var startAnimation = true
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    func start() {
        isTimerRunning.toggle()
    }
    
    func resetTimer() {
            timeRemaining = 0
            isTimerRunning = false
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text("Breath slowly")
                .font(.system(size: 17))
                .bold()
                .frame(maxWidth: .infinity)
                .foregroundColor(Color.theme.accent2)
            Text("Timer")
                .font(.system(size: 15))
                .bold()
                .frame(maxWidth: .infinity)
            Button(action: start) {
                Text("\(timeRemaining)")
                    .onReceive(timer) { _ in
                        if isTimerRunning && timeRemaining >= 0 {
                            timeRemaining += 1
                        }
                    }
            }
            .font(.system(size: 30))
            .bold()
            .foregroundColor(Color.theme.accent)

            Text("Heart Rate")
                .font(.system(size: 15))
                .bold()
                .frame(maxWidth: .infinity)

            Button(action: start) {
                Text("100")
            }
            .font(.system(size: 30))
            .bold()
            .foregroundColor(Color.theme.accent)
        }
    }
}


#Preview {
    metricsView(isTimerRunning: .constant(true), timeRemaining: .constant(0))
}

//
//  metricsView.swift
//  InnerZenApp Watch App
//
//  Created by Rohan Basnet on 11/7/23.
//  Shows the timer and heart rate for the app

import SwiftUI

struct metricsView: View {
    //Variables
    @State private var timeRemaining = 0
    @State private var isTimerRunning = false
    
    //Creates a timer variable that increases the
    //timer by 1 second
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    //Function that toggles the timer from starting or stopping
    func start() {
        isTimerRunning.toggle()
    }

    var body: some View {
        VStack(alignment: .leading) {
            //Label for timer
            Text("Timer")
                //Formatting
                .font(.system(size: 20))
                .bold()
                .frame(maxWidth: .infinity)
            //Button for the timer to start or pause
            Button(action: start) {
                Text("\(timeRemaining)")
                    .onReceive(timer) { _ in
                        if isTimerRunning && timeRemaining >= 0 {
                            timeRemaining += 1
                        }
                    }
            }   //Formatting
                .font(.system(size: 20))
                .bold()
                .foregroundColor(Color.theme.accent)

            //Label for heart rate
            Text(
                "Heart Rate"
            )
                //Formatting
                .font(.system(size: 20))
                .bold()
                .frame(maxWidth: .infinity)
            
            //Button for heart rate
            Button(action: start) {
                Text("100")
            }
                //Formatting
                .font(.system(size: 20))
                .bold()
                .foregroundColor(Color.theme.accent)

        }
    }
}

#Preview {
    metricsView()
}

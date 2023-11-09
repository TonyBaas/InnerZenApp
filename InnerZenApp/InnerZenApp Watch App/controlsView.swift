//
//  controlsView.swift
//  InnerZenApp Watch App
//
//  Created by Rohan Basnet on 11/7/23.
//  Displays the end and pause buttons

import SwiftUI

struct controlsView: View {
    @Binding var isTimerRunning: Bool
    @Binding var timeRemaining: Int
    
    @State private var buttonState: ButtonState = .play

    enum ButtonState {
        case pause, continued, play
    }
    
    var body: some View {
        HStack {
            VStack {
                // Button for the end session
                Button {
                    // Reset the timer
                    resetTimer()
                    
                } label: {
                    // Gets the "x" image from the system
                    Image(systemName: "xmark")
                }
                // Formatting
                .tint(Color.red)
                .font(.title2)
                // Label
                Text("End")
            }
            VStack {
                Button {
                    // Toggle the timer and update the button state
                    if isTimerRunning {
                        isTimerRunning.toggle()
                        buttonState = .continued
                    } else {
                        if buttonState == .continued {
                            isTimerRunning.toggle()
                            buttonState = .pause
                        } else {
                            // Reset the timer and set the button state to play
                            startTimer()
                        }
                    }
                } label: {
                    // Use the button state to display the appropriate image
                    Image(systemName: imageForButtonState())
                        .foregroundColor(colorForButtonState())
                }
                .font(.title2)
                Text(labelForButtonState())
            }
        }
    }
    func resetTimer() {
        timeRemaining = 0
        isTimerRunning = false
        buttonState = .play
    }
    func startTimer() {
        isTimerRunning = true
        buttonState = .pause
    }

    func imageForButtonState() -> String {
        switch buttonState {
            case .pause: return "pause"
            case .continued: return "play.fill"
            case .play: return "play.circle.fill"
        }
    }
    
    func colorForButtonState() -> Color {
            switch buttonState {
                case .pause: return .yellow // Change to the desired color for the "Pause" state
                case .continued: return .green // Change to the desired color for the "Continue" state
                case .play: return .blue // Change to the desired color for the "Play" state
            }
        }

    func labelForButtonState() -> String {
        switch buttonState {
            case .pause: return "Pause"
            case .continued: return "Continue"
            case .play: return "Play"
        }
    }
}

#Preview {
    controlsView(isTimerRunning: .constant(true), timeRemaining: .constant(0))
}

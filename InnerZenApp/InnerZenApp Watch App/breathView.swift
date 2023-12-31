//
//  breathView.swift
//  InnerZenApp Watch App
//
//  Created by Tony Baas on 10/26/23.
//

import SwiftUI

struct breathView: View {
    //Declare variable named selection
    //Set the selection to the metrics tab by default
    @State private var selection: Tab = .metrics
    @State private var isTimerRunning = false
    @State private var timeRemaining = 0

    //Enum named tab with two cases
    enum Tab {
        case controls, metrics
    }
    
    var body: some View {
        //Creates a tab view that can switch between
        //controls and metrics tab.
        TabView(selection: $selection) {
            //Gets the view from the controlsView()
            controlsView(isTimerRunning: $isTimerRunning, timeRemaining: $timeRemaining).tag(Tab.controls)
            //Gets the view from the metricsView()
            metricsView(isTimerRunning: $isTimerRunning, timeRemaining: $timeRemaining).tag(Tab.metrics)
        }
    }
}


#Preview {
    breathView()
}

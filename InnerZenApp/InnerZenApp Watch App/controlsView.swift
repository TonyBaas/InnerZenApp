//
//  controlsView.swift
//  InnerZenApp Watch App
//
//  Created by Rohan Basnet on 11/7/23.
//  Displays the end and pause buttons

import SwiftUI

struct controlsView: View {
    var body: some View {
        HStack {
            VStack {
                //Button for the end session
                Button {
                } label: {
                    //Gets the "x" image from the system
                    Image(systemName: "xmark")
                }
                //Formatting
                .tint(Color.red)
                .font(.title2)
                //Label
                Text("End")
            }
            VStack {
                //Button for pause
                Button {
                } label: {
                    //Get the image from the system
                    Image(systemName: "pause")
                }
                //Formatting
                .tint(Color.yellow)
                .font(.title2)
                //Label
                Text("Pause")
            }
        }
    }
}

#Preview {
    controlsView()
}

//
//  ContentView.swift
//  SMSU_3
//
//  Created by Andrei Kovryzhenko on 06.10.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            AnimatedButton(size: 60)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct AnimatedButton: View {
    @State private var buttonIsOn = false

    let size: CGFloat
    
    var body: some View {
        Button {
            guard !buttonIsOn else { return }
            buttonIsOn.toggle()
            withAnimation(
                .interpolatingSpring(stiffness: 80, damping: 12)) {
                buttonIsOn.toggle()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                buttonIsOn = false
            }
        } label: {
            ZStack {
    
                Circle()
                    .frame(width: size * 1.7)
                    .opacity(buttonIsOn ? 0.5 : 0)
                
                HStack() {
                    Image(systemName: "play.fill")
                        .font(.system(size: size))
                        .scaleEffect(
                            x: buttonIsOn ? 0 : 1,
                            y: buttonIsOn ? 0 : 1,
                            anchor: .trailing
                        )
                        .offset(x: buttonIsOn ? size * -1.12 : size * -0.37)
                        .opacity(buttonIsOn ? 0 : 1)
                }
                
                HStack(spacing: size * -0.13) {
                    Image(systemName: "play.fill")
                        .font(.system(size: size))
                        .foregroundColor(.blue)
                        .offset(x: buttonIsOn ? 0 : size * 0.75 )
                        
                    Image(systemName: "play.fill")
                        .font(.system(size: size))
                        .opacity(buttonIsOn ? 1 : 0)
                        .scaleEffect(buttonIsOn ? 1 : 0)
                        .offset(x: buttonIsOn ? 0 : size * 0.42 )
                }
            }
            .padding(.horizontal)
        }
        .clipped()
        .disabled(buttonIsOn)
    }
}


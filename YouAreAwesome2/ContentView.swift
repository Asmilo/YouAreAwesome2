//
//  ContentView.swift
//  YouAreAwesome2
//
//  Created by Michiel Nooij on 13/09/2026.
//

import SwiftUI

struct ContentView: View {
    
    @State private var message = ""
    @State private var imageName = ""
    @State private var imageNumber = 0
    
    @State private var messageNumber = 0
    @State private var lastImageNumber = -1
    @State private var lastMessageNumber = -1
    
    var body: some View {
        VStack {
            Text(message)
                .foregroundStyle(.red)
                .fontWeight(.light)
                .font(.largeTitle)
                .frame(height: 100)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 10)
                .animation(.easeInOut, value: imageName)
            
            Spacer()
            
            Button("Click Me") {
                
                
                let messages = ["You are great", "I know, I am great", "Thanks, for being you", "Whats wrong with me ?"]
                
                repeat {
                    messageNumber = Int.random(in: 0...messages.count-1)
                } while messageNumber == lastMessageNumber
                
                lastMessageNumber = messageNumber
                message = messages[messageNumber]
                
                repeat {
                    imageNumber = Int.random(in: 0...9)
                } while imageNumber == lastImageNumber
                
                lastImageNumber = imageNumber
                imageName = "image\(imageNumber)"
                
//                if imageNumber > 8 {
//                    imageNumber = 0
//                } else {
//                    imageNumber += 1
//                }
                
                
                
                
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

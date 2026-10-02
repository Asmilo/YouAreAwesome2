//
//  ContentView.swift
//  YouAreAwesome2
//
//  Created by Michiel Nooij on 13/09/2026.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    
    @State private var message = ""
    @State private var imageName = ""
    @State private var imageNumber = 0
    
    @State private var messageNumber = 0
    @State private var lastImageNumber = -1
    @State private var lastMessageNumber = -1
    @State private var lastSoundnumber = -1
    
    @State private var soundName = ""
    @State private var audioPlayer: AVAudioPlayer!
    
    @State private var soundIsOn: Bool = true
    
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
            
            HStack {
                Text("Sound on:")
                Toggle("", isOn: $soundIsOn)
                    .labelsHidden()
                    .onChange(of: soundIsOn) {
                        if audioPlayer != nil && audioPlayer.isPlaying {
                            audioPlayer.stop()
                        }
                    }
                Spacer()
                Button("Click Me") {
                    
                    
                    let messages = ["You are great", "I know, I am great", "Thanks, for being you", "Whats wrong with me ?"]
                    
                    lastMessageNumber = nonRepeatingRandom(lastNumber: lastMessageNumber, upperBounds: messages.count-1)
                    message = messages[lastMessageNumber]
                    
                    lastImageNumber = nonRepeatingRandom(lastNumber: lastImageNumber, upperBounds: 9)
                    imageName = "image\(lastImageNumber)"
                    
                    if soundIsOn {
                        
                        if audioPlayer != nil {
                            audioPlayer.stop()
                        }
                        
                        lastSoundnumber = nonRepeatingRandom(lastNumber: lastSoundnumber, upperBounds: 5)
                        playsound(sound: "sound\(lastSoundnumber)")
                    }
                    
                }
                .buttonStyle(.borderedProminent)
            }
            .padding(.horizontal)
        }
        .padding()
    }
    
    func playsound(sound: String) {
        guard let soundfile = NSDataAsset(name: sound) else {
            print("😡 Error, can not find the soundfile")
            return
        }
        
        do { audioPlayer = try AVAudioPlayer(data: soundfile.data)
            audioPlayer.play()
        }
        catch {
            print("😡 Error, can not create the audioPlayer")
        }
        
        
    }
    
    func nonRepeatingRandom(lastNumber: Int, upperBounds: Int) -> Int {
        
        var numberRandom: Int
        
        repeat {
            numberRandom = Int.random(in: 0...upperBounds-1)
        } while numberRandom == lastNumber
        
        return numberRandom
        
    }
}

#Preview {
    ContentView()
}

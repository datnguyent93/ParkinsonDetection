//
//  ContentView2.swift
//  
//


import SwiftUI

struct RecordAndStop: View {
    
    @ObservedObject var audioRecorder: AudioRecorder
    
    var body: some View {
        NavigationView {
            VStack {
               // RecordingsList(audioRecorder: audioRecorder)
                Spacer()
                if audioRecorder.recording == false {
                    Button(action: {self.audioRecorder.startRecording()}) {
                        Image(systemName: "mic.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 70)
                            .clipped()
                            .foregroundColor(.red)
                            .padding(.bottom, 11)
                            .position(x: 330,y:900)
                    }
                } else {
                    Button(action: {self.audioRecorder.stopRecording()}) {
                        Image(systemName: "mic.slash.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 70)
                            .clipped()
                            .foregroundColor(.red)
                            .padding(.bottom, 11)
                            .position(x: 330,y:900)
                    }
                }
            }.position(x: 500,y:500)
            //.navigationBarTitle("Voice Recorder")
           // .navigationBarItems(trailing: EditButton())
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecordAndStop(audioRecorder: AudioRecorder())
    }
}
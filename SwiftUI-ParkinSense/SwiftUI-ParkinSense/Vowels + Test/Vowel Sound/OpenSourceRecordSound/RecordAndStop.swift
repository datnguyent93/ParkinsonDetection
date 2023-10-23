//
//  ContentView2.swift
//
//


// our modification
// changes recording from manual to automatic
import SwiftUI

struct RecordAndStop: View {
    @ObservedObject var audioRecorder: AudioRecorder
    @State var finished = false
    var body: some View {
        VStack{
            if (finished == false) {
                if audioRecorder.recording == false {
                    
                    Image(systemName: "mic.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 70)
                        .clipped()
                        .foregroundColor(.black)
                        .padding(.bottom, 11)
                        .onAppear()
                    {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 25.0){
                            self.audioRecorder.startRecording()
                            audioRecorder.recording = true
                        }}
                }
                else {
                   
                    Image(systemName: "mic.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 70)
                        .clipped()
                        .foregroundColor(.red)
                        .padding(.bottom, 11)
                        .onAppear()
                    {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 6.0){
                            self.audioRecorder.stopRecording()
                            
                            finished = true
                        }
                    }
                    
                    
                }
            }
                
           
            
        }.offset(x:-536, y:392)
    }
}

#Preview {
    RecordAndStop(audioRecorder: AudioRecorder())
}

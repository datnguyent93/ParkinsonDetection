//
//  Extensions.swift
//  Voice Recorder
// OPENSOURCE
//  Created by Pinlun on 2019/10/30.
//  Copyright © 2019 Pinlun. All rights reserved.
//

import SwiftUI

struct RecordAndStop2: View {
    
    @ObservedObject var audioRecorder: AudioRecorder
    
    var body: some View {
        NavigationView {
            VStack {
                RecordingsList(audioRecorder: audioRecorder)
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
                            
                    }
                }
            }
            .navigationBarTitle("Vowels Recorded")
            .navigationBarItems(trailing: EditButton())
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct Content_Previews: PreviewProvider {
    static var previews: some View {
        RecordAndStop2(audioRecorder: AudioRecorder())
    }
}

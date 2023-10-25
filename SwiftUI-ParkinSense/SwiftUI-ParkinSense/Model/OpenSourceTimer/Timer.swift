//
//  Timer.swift
//  SwiftUI-ParkinSense
//
//  Owner https://marcgg.com/blog/2020/05/06/circular-progressbar-clock-swiftui/
//

import SwiftUI

let timer = Timer
    .publish(every: 1, on: .main, in: .common)
    .autoconnect()

struct Clock: View {
    var counter: Int
    var countTo: Int
    
    var body: some View {
        VStack {
            Text("Timer")                                           //our modification
            .font(.custom("Avenir Next", size: 60))
            .fontWeight(.black)
            .foregroundColor(.red)
            Text(counterToMinutes())
                .font(.custom("Avenir Next", size: 60))
                .fontWeight(.black)
        }
    }
    
    func counterToMinutes() -> String {
        let currentTime = countTo - counter
        let seconds = currentTime % 60
        
        return "\(seconds < 10 ? "0" : "")\(seconds)"
    }
    
}

struct ProgressTrack: View {
    var body: some View {
        Circle()
            .fill(Color.clear)
            .frame(width: 250, height: 250)
            .overlay(
                Circle().stroke(Color.black, lineWidth: 15)
        )
    }
}

struct ProgressBar: View {
    var counter: Int
    var countTo: Int
    
    var body: some View {
        Circle()
            .fill(Color.clear)
            .frame(width: 250, height: 250)
            .overlay(
                Circle().trim(from:0, to: progress())
                    .stroke(
                        style: StrokeStyle(
                            lineWidth: 15,
                            lineCap: .round,
                            lineJoin:.round
                        )
                )
                    .foregroundColor(
                        (completed() ? Color.green : Color.orange)
                ).animation(
                    .easeInOut(duration: 0.2)
                )
        )
    }
    
    func completed() -> Bool {
        return progress() == 1
    }
    
    func progress() -> CGFloat {
        return (CGFloat(counter) / CGFloat(countTo))
    }
}

struct CountdownView: View {
    @State var counter: Int = 0
    var countTo: Int = 5
    
    var body: some View {
        
        VStack{
            ZStack{
                ProgressTrack()
                ProgressBar(counter: counter, countTo: countTo)
                Clock(counter: counter, countTo: countTo)
                    .onAppear(){                    //our modification
                        playSound(soundName: "Timer", extension: "mp3", delay: 24.0)     // Play timer sound after delay
                       
                        
                    }
            }
        }.onReceive(timer) { time in         //our modification
            DispatchQueue.main.asyncAfter(deadline: .now() + 25.0) {      //delay the timer from starting
                if (self.counter < self.countTo) {
                    self.counter += 1
                }
            }
            
        }
        
    }
}


struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        
        CountdownView()
    }
}

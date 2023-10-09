//
//  TestVowel.swift
//  SwiftUI-ParkinSense
//
//  Created by Emnet Alemayehu on 10/8/23.
//


import SwiftUI

struct TestVowel: View {
    @State private var fadeInOut = false
    var body: some View {
        ZStack{
            Instruction()
            ZStack{
                TimerView()
                Vowel()
             //   Goodjob()
            }
            
        }
    }
}
struct Instruction: View {
    @State private var fadeInOut = false
    var body: some View {
        VStack{
            Text("Instruction")
                .bold()
                .font(.custom("Avenir Next", size: 80))
            Text(" Please repeat the vowel you hear.\n You will have 5 seconds to Attempt and complete the task.")
                .font(.custom("Gurmukhi MN", size: 40))
        }.opacity(fadeInOut ? 0 : 1)
        .animation(Animation.easeOut(duration: 5.4) .delay(0.2), value: fadeInOut)
        .onAppear(){
            fadeInOut = true

        }
        
    
    
    }
        
}

struct Vowel: View {
    @State private var fadeInOut = true
   
    var body: some View {
        ZStack{
            Rectangle()
                .background(Color.black.opacity(0.5))
                .frame(width: 700, height: 600)
            Text("E")
                .font(.custom("E", size: 500))
                .bold()
                .font(.largeTitle)
                .padding()
                .frame(width: 680, height: 580)
                .background(Color.white.opacity(0.85))
            
        }.opacity(fadeInOut ? 0 : 1)
            .animation(Animation.easeInOut(duration: 6.4) .delay(1.4), value: fadeInOut)
            .onAppear(){
                fadeInOut = false

            }
        

    }
}

struct TimerView: View {
    @State private var fadeInOut = true
    @State var timeRemaining = 5
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
       
        Text("\(timeRemaining)")
            .onReceive(timer){ _ in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                }
            }.font(.custom("Gurmukhi MN", size: 70))
            .fontWeight(.black)
              .position(CGPoint(x: 1230.0, y: 140.0))
              .onAppear(){DispatchQueue.main.asyncAfter(deadline: .now() + 1.2){
                  self.fadeInOut.toggle()
                  
              }
                  }
                  .opacity(fadeInOut ? 1 : 0)
                      .animation(Animation.easeIn(duration: 1.4) .delay(5.4), value: fadeInOut)
  
        
        
    }
}


struct Goodjob: View {
    @State private var fadeInOut = true
   
    var body: some View {
        
        Text("Good Job!")
            .font(.custom("", size: 90))
            .bold()
            .font(.largeTitle)
            .onAppear(){
                fadeInOut = false
                
      
            }
            .opacity(fadeInOut ? 0 : 1)
            .animation(Animation.easeOut(duration: 3.4) .delay(2.4), value: fadeInOut)
            
    }
}
#Preview {
    TestVowel()
}

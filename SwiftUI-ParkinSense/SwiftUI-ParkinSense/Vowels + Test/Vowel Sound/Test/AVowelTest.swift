//
//  AVowelTest.swift
//  SwiftUI-ParkinSense
//
//  Created by Emnet.A on 10/8/23.
//



import SwiftUI


struct AVowelTest: View {
    @State private var fadeInOut = false
    var body: some View {
        NavigationView{
            ZStack{
               
            Instruction()
            ZStack{
                RecordAndStop(audioRecorder: AudioRecorder())
                AVowel()
  
               TimerView()
                Goodjob()
                NextButton()
            }
        }

        }.navigationViewStyle(StackNavigationViewStyle())
    }
}
struct Instruction: View {
    @State private var fadeInOut = false
    var body: some View {
        VStack{
            Text("Instruction")  
                .bold()
                .font(.custom("Avenir Next", size: 80))
            Text(" Please repeat the vowel you hear.\n You will have 5 seconds to Attempt and complete the task.\n The timer will start after you hear the vowel for the second time.\n Then the mic will turn red for recording.")
                .font(.custom("Gurmukhi MN", size: 40))
        }.opacity(fadeInOut ? 0 : 1)
        .animation(Animation.easeInOut(duration: 7.4) .delay(1.2), value: fadeInOut)
        .onAppear(){
            fadeInOut = true

        }
    }
        
}

struct NextButton: View {
    @State private var fadeInOut = true
    var body: some View {
        NavigationLink{
        EVowelTest()
            .navigationBarBackButtonHidden()
         
    } label: {
        Text("Next")
    }.foregroundColor(.white)
        .font(.title)
        .bold()
        .frame(width: 300, height: 50)
        .background(Color.purple)
        .cornerRadius(40)
        .position(x: 973, y:937)
        .opacity(fadeInOut ? 0 : 1)
        .animation(Animation.easeInOut(duration: 33.4) .delay(30.4), value: fadeInOut)
        
            .onAppear(){
                fadeInOut = false

            }
    }
}
struct AVowel: View {
    @State private var fadeInOut = true
   
    var body: some View {
        
                ZStack{
                    
                    Rectangle()
                        .background(Color.black.opacity(0.5))
                        .frame(width: 700, height: 600)
                    Text("A")
                        .font(.custom("Palatino", size: 500))
                        .bold()
                        .font(.largeTitle)
                        .padding()
                        .frame(width: 680, height: 580)
                        .background(Color.white.opacity(0.85))
                    
            }.onAppear(){
                playSound(soundName: "ASound", extension: "mp3", delay: 9.0)
                

            }
            .opacity(fadeInOut ? 0 : 1)
                .animation(Animation.easeInOut(duration: 4.4) .delay(7.4), value: fadeInOut)
            .onAppear(){
                fadeInOut = false
            }
            
            .opacity(fadeInOut ? 1 : 0)
                .animation(Animation.easeInOut(duration: 29.4) .delay(29.0), value: fadeInOut)
            
               
        

    }
}

struct TimerView: View {
    @State private var fadeInOut = true
    
    var body: some View {
    
            ZStack{
                CountdownView()
                    .opacity(fadeInOut ? 0 : 1)
                    .animation(Animation.easeInOut(duration: 5.4) .delay(7.4), value: fadeInOut)
                
                     
                   
                
            } .position(CGPoint(x: 1220.0, y: 140.0))
                .onAppear(){
                    fadeInOut = false
                    
                }
                .opacity(fadeInOut ? 1 : 0)
                .animation(Animation.easeInOut(duration: 30.4) .delay(29.0), value: fadeInOut)
            
            
  
        }
        
    }



struct Goodjob: View {
    @State private var fadeInOut = true
   
    var body: some View {
        
        Text("Good Job!")
            .font(.custom("", size: 90))
            .bold()
            .font(.largeTitle)
            .opacity(fadeInOut ? 0 : 1)
            .animation(Animation.easeInOut(duration: 36.4) .delay(35.9), value: fadeInOut)
            
                .onAppear(){
                    fadeInOut = false

                }
            
    }
}

#Preview {
    AVowelTest()
    
}

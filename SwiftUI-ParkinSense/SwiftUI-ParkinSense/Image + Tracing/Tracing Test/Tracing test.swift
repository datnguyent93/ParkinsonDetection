//
//  Tracing test.swift
//  SwiftUI-ParkinSense
//
//  Created by Emnet.A on 10/17/23.
//

import SwiftUI


struct Tracing_test: View {
    @State private var fadeInOut = false
    @State private var shouldShowDestination = false
    static let text = "."
    var body: some View {
        NavigationView{
            ZStack{
                TracingInstruction()
                ZStack{
                    ImageTrace()
                    Attempt()
                    Goodjob2()
                    AtemptButton()
                    
                   
                }
            }
            .background(Color.black)
            
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct TracingInstruction: View {
    @State private var fadeInOut = false
    var body: some View {
        VStack{
            Text("Instruction")
                .bold()
                .font(.custom("Avenir Next", size: 80))
                .foregroundColor(.white)
            Text("Please trace the following image from the left edge to the center.\n You will have 3 Attempts to complete the task.")
                .font(.custom("Gurmukhi MN", size: 40))
                .foregroundColor(.white)
        }.opacity(fadeInOut ? 0 : 1)
        .animation(Animation.easeOut(duration: 5.4) .delay(4.2), value: fadeInOut)
        .onAppear(){
            fadeInOut = true 

        }

    }
        
}


struct ImageTrace: View {
    @State private var fadeInOut = true
    var body: some View {
        HStack{
            SpiralImage()
                .opacity(fadeInOut ? 0 : 1)
                    .animation(Animation.easeInOut(duration: 4.4) .delay(7.4), value: fadeInOut)
                
                    .onAppear(){
                        fadeInOut = false

                    }
        } .onAppear(){
        fadeInOut = false
       
            }
            .opacity(fadeInOut ? 1 : 0)
            .animation(Animation.easeInOut(duration: 29.4) .delay(29.0), value: fadeInOut)
    }
        
}

struct AtemptButton: View {
    @State private var fadeInOut = true
    var body: some View {
        NavigationLink{
        Result()
            .navigationBarBackButtonHidden()
        
    } label: {
        Text("Next Attempt")
    }.foregroundColor(.white)
        .font(.title)
        .bold()
        .frame(width: 300, height: 50)
        .background(Color.purple)
        .cornerRadius(40)
        .position(x: 973, y:937)
        .opacity(fadeInOut ? 0 : 1)
        .animation(Animation.easeInOut(duration: 31.4) .delay(30.4), value: fadeInOut)
        
            .onAppear(){
                fadeInOut = false

            }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct Attempt: View {
    @State private var fadeInOut = true
   
    var body: some View {
        ZStack{
            Circle()
                .scale(0.2)
                .foregroundColor(Color("pGreen"))
            VStack{
                Text("Attempt")
                    .font(.custom("Avenir Next", size: 40))
                    .bold()
                    .foregroundColor(.black)
                Text("1")
                    .font(.custom("Gurmukhi MN", size: 60))
                    .bold()
                    .foregroundColor(.black)
            }
        }.position(CGPoint(x: 1220.0, y: 140.0))
            .opacity(fadeInOut ? 0 : 1)
                .animation(Animation.easeInOut(duration: 4.4) .delay(7.4), value: fadeInOut)
            
                .onAppear(){
                    fadeInOut = false

                }
            .onAppear(){
            fadeInOut = false
           
                }
                .opacity(fadeInOut ? 1 : 0)
                .animation(Animation.easeInOut(duration: 29.4) .delay(29.0), value: fadeInOut)
            
    }
}

struct Goodjob2: View {
    @State private var fadeInOut = false
   
    var body: some View {
        
        Text("Good Job!")
            .font(.custom("", size: 90))
            .bold()
            .font(.largeTitle)
            .opacity(fadeInOut ? 1 : 0)
            .animation(Animation.easeInOut(duration: 31.4) .delay(30.4), value: fadeInOut)
            
                .onAppear(){
                    fadeInOut = true

                }
            
    }
}
#Preview {
    Tracing_test()
}


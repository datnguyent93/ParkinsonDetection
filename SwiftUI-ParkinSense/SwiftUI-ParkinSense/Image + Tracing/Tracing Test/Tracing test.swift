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
                    Goodjob2()
                    AtemptButton()
                    
                   
                }
            }
            
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
            Text("Please trace the following image from the left edge to the center.\n You will have 3 Attempts to complete the task.")
                .font(.custom("Gurmukhi MN", size: 40))
        }.opacity(fadeInOut ? 0 : 1)
        .animation(Animation.easeOut(duration: 5.4) .delay(0.2), value: fadeInOut)
        .onAppear(){
            fadeInOut = true

        }

    }
        
}


struct ImageTrace: View {
    @State private var fadeInOut = false
    var body: some View {
        HStack{
            SpiralImage()
        }
        .onAppear(){
            fadeInOut = true
        }
        .opacity(fadeInOut ? 1 : 0)
        .animation(Animation.easeInOut(duration: 15.4) .delay(4.2), value: fadeInOut)
        .onAppear(){
            fadeInOut = true
        }
        .opacity(fadeInOut ? 0 : 1)
        .animation(Animation.easeOut(duration: 15.4) .delay(16.2), value: fadeInOut)
    }
        
}

struct AtemptButton: View {
    @State private var fadeInOut = true
    var body: some View {
        NavigationLink{
        Tracing_test2()
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
        .animation(Animation.easeInOut(duration: 31.4) .delay(4.4), value: fadeInOut)
        
            .onAppear(){
                fadeInOut = false

            }.navigationViewStyle(StackNavigationViewStyle())
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
                .animation(Animation.easeInOut(duration: 31.4) .delay(19.4), value: fadeInOut)
            
                .onAppear(){
                    fadeInOut = true

                }
            
    }
}
#Preview {
    Tracing_test()
}


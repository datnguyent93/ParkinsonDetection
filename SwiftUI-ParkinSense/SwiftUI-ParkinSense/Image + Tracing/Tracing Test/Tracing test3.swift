//
//  Tracing test3.swift
//  SwiftUI-ParkinSense
//
//  Created by Emnet.A on 10/17/23.
//

import SwiftUI

struct Tracing_test3: View {
    @State private var fadeInOut = false
    @State private var shouldShowDestination = false
    static let text = "."
    var body: some View {
        NavigationView{
            ZStack{
                TracingInstruction3()
                ZStack{
                    ImageTrace()
                    Attempt3()
                    Goodjob2()
                    ResultButton()
                    
                   
                }
            }
            
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}
 
struct TracingInstruction3: View {
    @State private var fadeInOut = false
    var body: some View {
        VStack{
            Text("Attempt 3")
                .font(.custom("Gurmukhi MN", size: 50))
        }.opacity(fadeInOut ? 0 : 1)
            .animation(Animation.easeOut(duration: 5.4) .delay(4.2), value: fadeInOut)
            .onAppear(){
                fadeInOut = true

        }

    }
      
        
}

struct Attempt3: View {
    @State private var fadeInOut = true
   
    var body: some View {
        ZStack{
            Circle()
                .scale(0.2)
                .foregroundColor(.gray.opacity(0.4))
            VStack{
                Text("Attempt")
                    .font(.custom("Avenir Next", size: 40))
                    .bold()
                    .foregroundColor(.black)
                Text("3")
                    .font(.custom("Gurmukhi MN", size: 60))
                    .bold()
                    .foregroundColor(.red)
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

struct ResultButton: View {
    @State private var fadeInOut = true
    var body: some View {
        NavigationLink{
        Result()
            .navigationBarBackButtonHidden()
        
    } label: {
        Text("Result")
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

#Preview {
    Tracing_test3()
}


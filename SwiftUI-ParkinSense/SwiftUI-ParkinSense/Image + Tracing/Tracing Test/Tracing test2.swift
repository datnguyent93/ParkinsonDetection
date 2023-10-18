//
//  Tracing test2.swift
//  SwiftUI-ParkinSense
//
//  Created by Emnet.A on 10/17/23.
//

import SwiftUI

struct Tracing_test2: View {
    @State private var fadeInOut = false
    @State private var shouldShowDestination = false
    static let text = "."
    var body: some View {
        NavigationView{
            ZStack{
                TracingInstruction2()
                ZStack{
                    ImageTrace()
                    Goodjob2()
                    AtemptButton2()
                    
                   
                }
            }
            
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct TracingInstruction2: View {
    @State private var fadeInOut = false
    var body: some View {
        VStack{
            Text("Attempt 2")
                .font(.custom("Gurmukhi MN", size: 50))
        }.opacity(fadeInOut ? 0 : 1)
        .animation(Animation.easeOut(duration: 5.4) .delay(0.2), value: fadeInOut)
        .onAppear(){
            fadeInOut = true

        }

    }
        
}




struct AtemptButton2: View {
    @State private var fadeInOut = true
    var body: some View {
        NavigationLink{
        Tracing_test3()
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

#Preview {
    Tracing_test2()
}

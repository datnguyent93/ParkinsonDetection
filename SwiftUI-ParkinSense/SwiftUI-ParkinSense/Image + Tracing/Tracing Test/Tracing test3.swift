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
                TracingInstruction2()
                ZStack{
                    ImageTrace()
                    Goodjob2()
                    ResultButton()
                    
                   
                }
            }
            
        }.navigationViewStyle(StackNavigationViewStyle())
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


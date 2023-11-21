//
//  MainPage.swift
//  SwiftUI-ParkinSense
//
//  Created by Emnet Alemayehu on 10/8/23.
//

import SwiftUI

struct MainPage: View {
    var body: some View {
        NavigationStack{
            ZStack{
                ZStack{
                    MenuBar()
                    TestDiscription()
                    
                    
                    NavigationLink{
                        AVowelTest()
                            .navigationBarBackButtonHidden()
                    } label: {
                        Text("Take Test")
                    }
                    .foregroundColor(.white)
                    .font(.title)
                    .bold()
                    .frame(width: 300, height: 50)
                    .background(Color("BarColor").opacity(0.85))
                    .cornerRadius(40)
                    .position(x:957, y:856)
                }
            }
                
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct TestDiscription: View {
    var body: some View {
        VStack{
                Text("Test Description")
                .font(.custom("Optima Bold", size: 60))
                .bold()
                .font(.largeTitle)
                .position(x: 690, y:140)
            HStack{
                Image(systemName: "mic.fill")
                    .accentColor(.black)
                    .font(.system(size: 50))
                Text("Vowel Sound Test")
                .bold()
                .font(.largeTitle)
                
            }.position(x: 250, y:50)
            Text("In this section of the test, you will be asked to repeat the 5 vowels you hear. An audio and visualization of the vowels will be provided. You will have 5 seconds to attempt to complete the task.")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .frame(width: 1000)
                .font(.custom("", size: 30))
                .position(x: 650, y:-10)
            HStack{
                Image(systemName: "pencil.and.scribble")
                    .accentColor(.black)
                    .font(.system(size: 50))
                Text("Tracing Test")
                .bold()
                .font(.largeTitle)
                
            }.position(x: 200, y:-20)
            Text("In this section of the test, you will be asked to trace and connect a dotted lines. Please trace the following image from the left edge to the center. You will have 3 attempts to complete the task.")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .frame(width: 1000)
                .font(.custom("", size: 30))
                .position(x: 650, y:-80)
        }
    }
}


    
#Preview {
    MainPage()
}

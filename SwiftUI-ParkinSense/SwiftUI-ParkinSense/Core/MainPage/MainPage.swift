//
//  MainPage.swift
//  SwiftUI-ParkinSense
//
//  Created by Emnet Alemayehu on 10/8/23.
//

import SwiftUI

struct MainPage: View {
    let screen = UIScreen.main.bounds
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    MenuBar()
                        //.border(.blue)
                    TestDescription()
                        .offset(y: -(screen.height * 0.1))
                        
                    
                    
                    NavigationLink{
                        AVowelTest()
                            .navigationBarBackButtonHidden()
                    } label: {
                        Text("Start Test")
                    }
                    .foregroundColor(.black)
                    .font(.title)
                    .bold()
                    .frame(width: 300, height: 50)
                    .background(Color("pGreen"))
                    .cornerRadius(40)
                    .offset(y: -(screen.height * 0.05))
                    //.position(x:957, y:856)
                }
            }
            .background(Color.black)
                
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct TestDescription: View {
    let screen = UIScreen.main.bounds
    var body: some View {
        VStack{
            Text("Test Description")
                .font(.custom("Constantia", size: 60))
                .bold()
                .font(.largeTitle)
                //.position(x: 690, y:140)
                .foregroundColor(.white)
                .padding(.bottom, screen.height * 0.05)
            Text("Below, you will find an overview of the two tests that we will conduct. Please tap on the green \"Start Test\" button when you are ready to proceed.")
                //.fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .frame(width: screen.width * 0.8, alignment: .leading)
                .frame(maxHeight: .infinity)
                .font(.custom("Helvetica Neue", size: 30))
                //.position(x: 650, y:-10)
                .foregroundColor(.white)
                .padding(.bottom, screen.height * 0.05)
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            HStack{
                
                Image(systemName: "mic.fill")
                    .accentColor(.white)
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                Text("Vowel Sound Test")
                    .bold()
                    .font(.custom("Constantia", size:45))
                    .foregroundColor(.white)
            }
            .padding(.bottom, 3)
            //.position(x: 250, y:50)
            Text("For the first section of the test, you will be asked to repeat the 5 vowels you hear. An audio and visualization of the vowels will be provided. You will have 5 seconds to attempt to complete the task.")
                //.fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .frame(width: screen.width * 0.8, alignment: .leading)
                .font(.custom("Helvetica Neue", size: 30))
                //.position(x: 650, y:-10)
                .foregroundColor(.white)
                .padding(.bottom, screen.height * 0.05)
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.leading)
            HStack{
                Image(systemName: "pencil.and.scribble")
                    .accentColor(.white)
                    .foregroundColor(.white)
                    .font(.system(size: 50))
                Text("Tracing Test")
                    .bold()
                    .font(.custom("Constantia", size:45))
                    .foregroundColor(.white)
                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            }
            .padding(.bottom, 3)
            //.position(x: 200, y:-20)
            Text("For the second section of the test, you will be asked to trace and connect a dotted lines. Please trace the following image from the left edge to the center. You will have 3 attempts to complete the task.")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .frame(width: screen.width * 0.8, alignment: .leading)
                .font(.custom("", size: 30))
                //.position(x: 650, y:-80)
                .foregroundColor(.white)
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
        }//vstack
        //.border(.blue)
    }
}


    
#Preview {
    MainPage()
}

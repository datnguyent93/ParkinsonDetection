//
//  MainPage.swift
//  SwiftUI-ParkinSense
//
//  Created by Emnet Alemayehu on 10/8/23.
//

import SwiftUI

struct MainPage: View {
    var body: some View {
        
      ZStack{
        Rectangle()
            .frame(height: 160)
            .position(x: 683, y: 0)
            .foregroundColor(.blue.opacity(0.75))
          HStack {
              Text("Wellcome + $username")
                  .foregroundColor(.black)
                  .bold()
                  .position(x:150, y:30)
                  .font(.custom("E", size: 20))
              Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label:  {
                  Image("Notification")
                      .resizable()
                      .frame(width: 50, height: 50, alignment: .topLeading)
                  
              })
                .position(x:680, y:30)
              ZStack{
                 
                  Menu {
                      Button("Profile", action: Profile)
                      Button("Setting", action: Setting)
                      Button("LogOut", action: Profile)
                      
                          } label: {
                              Image("Menu")
                                  .resizable()
                                  .frame(width: 50, height: 50, alignment: .topLeading)
                          }
             
            }.position(x:350, y:30)
         }
          TestDiscription()
         
          Button("Take Test"){
              NavigationLink(destination: ProfilePage()){
                  
          }
            }.foregroundColor(.white)
              .font(.title)
              .bold()
              .frame(width: 300, height: 50)
              .background(Color.purple)
              .cornerRadius(40)
              .position(x:1060, y:860)
            }
       
    }
}

struct TestDiscription: View {
    var body: some View {
        VStack{
                Text("Test Description")
                .font(.custom("", size: 60))
                .bold()
                .font(.largeTitle)
                .position(x: 700, y:140)
            HStack{
                Image("Micimg")
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .topLeading)
                
                Text("Vowel Sound Test")
                .bold()
                .font(.largeTitle)
                
            }.position(x: 250, y:50)
            Text("In this section of the test, you will be asked to repeat the 5 vowels you hear. An audio and visualization of the vowels will be provided. You will have 5 seconds to Attempt to complete the task.")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .frame(width: 1000)
                .font(.custom("", size: 30))
                .position(x: 650, y:-10)
            HStack{
                Image("Tracingimg")
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .topLeading)
                Text("Tracing Test")
                .bold()
                .font(.largeTitle)
                
            }.position(x: 200, y:-20)
            Text("In this section of the test, you will be asked to trace and connect a doted lines. Please trace the following image from the left edge to the center. You will have 3 Attempts to complete the task.")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .frame(width: 1000)
                .font(.custom("", size: 30))
                .position(x: 650, y:-80)
        }
    }
}

func Profile(){}
func Setting(){}
func LogOut(){}
#Preview {
    MainPage()
}

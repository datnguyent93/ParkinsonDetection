//
//  ContentView.swift
//  SwiftUI-ParkinSense
//
//  Created by user242759 on 04/07/1402 AP.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ZStack{
                
                VStack{
                    Image("Logo")
                        .resizable()
                    
                        Button("Tap to continue"){
                            NavigationLink(destination: ProfilePage()){
                                
                        }
                        
                    }.foregroundColor(.white)
                        .font(.title)
                        .bold()
                        .frame(width: 300, height: 50)
                        .background(Color.purple)
                        .cornerRadius(40)
                }
                
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}



#Preview {
    ContentView()
}


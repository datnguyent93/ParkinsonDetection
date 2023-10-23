//
//  ContentView.swift
//  SwiftUI-ParkinSense
//
//  Created by user242759 on 04/07/1402 AP.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                
                VStack{
                    Image("Logo")
                        .resizable()
                    
                    NavigationLink{
                        //ProfilePage()
                        Login()
                            .navigationBarBackButtonHidden()
                    } label: {
                        Text("Tap to Continue")
                    }.foregroundColor(.white)
                        .font(.title)
                        .bold()
                        .frame(width: 300, height: 50)
                        .background(Color.purple)
                        .cornerRadius(40)
                    
                }
            }
            
        }
    }
}



#Preview {
    ContentView()
}


